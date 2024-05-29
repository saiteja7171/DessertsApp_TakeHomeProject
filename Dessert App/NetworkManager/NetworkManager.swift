import Foundation
import UIKit

enum HTTPMethod: String{
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
    case put    = "PUT"
}
enum NetworkError: String, Error{
    case invalidURL       = "invalid URL"
    case badRequest       = "Bad Request"
    case decodingError    = "Decoding Error"
    case invalidResponse  = "Invalid Response"
    case invalidData      = "Invalid Data"
    case timeOut          = "Time Out"
    case noInternet       = "No Internet"
    case sessionExpired   = "Session Expired"
    case unableToComplete = "Unable To Complete"
}
class NetworkManager: NSObject{
    static let shared = NetworkManager()
    
    func request<T:Decodable>(type:T.Type,url: String, httpmethod: HTTPMethod, parameters: [String: Any] = [:], view: UIView, isAnimate:Bool, isTokenRequired: Bool, completion completionHandler: @escaping(Result<T,NetworkError>) -> Void) {
        
        
        Task.detached(priority: .userInitiated) {
            do {
                var activityIndicator = await UIActivityIndicatorView()
                if isAnimate{
                    DispatchQueue.main.async {
                        activityIndicator = self.showActivityIndicator(view: view)
                    }
                }
                guard let url = URL(string: url) else{
                    self.removeActivityIndicator(indicator: activityIndicator)
                    completionHandler(.failure(.invalidURL))
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod          = httpmethod.rawValue
                request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
                
                if !parameters.isEmpty {
                    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else{
                        return
                    }
                    request.httpBody = httpBody
                }
                let httpdata = try await self.fetchData(from: request)
                
                do {
                    let json = try JSONDecoder().decode(T.self, from: httpdata)
                    DispatchQueue.main.async {
                        self.removeActivityIndicator(indicator: activityIndicator)
                        completionHandler(.success(json))
                    }
                } catch{
                    DispatchQueue.main.async {
                        self.removeActivityIndicator(indicator: activityIndicator)
                        completionHandler(.failure(.decodingError))
                    }
                }
                
            } catch let error {
                switch error._code{
                case -1009:
                    DispatchQueue.main.async {
                        completionHandler(.failure(.noInternet))
                    }
                    break
                case -1001:
                    DispatchQueue.main.async {
                        completionHandler(.failure(.timeOut))
                    }
                    break
                default: 
                    if let err = error as? NetworkError {
                        completionHandler(.failure(err))
                    } else {
                        completionHandler(.failure(.unableToComplete))
                    }
                    break
                }
            }
        }
    }

    func fetchData(from urlRequest: URLRequest) async throws -> Data {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest  = 60
        configuration.timeoutIntervalForResource = 60
        let session = URLSession(configuration: configuration)
        let (data, response) = try await session.data(for: urlRequest)
        
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 500 {
                throw NetworkError.sessionExpired
            } else if (201..<300).contains(httpResponse.statusCode) {
                throw NetworkError.invalidResponse
            }
                    }
        if data.isEmpty {
            throw NetworkError.invalidData
        }
        return data
    }
}
