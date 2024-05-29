import UIKit

class DessertViewController: UIViewController {

    @IBOutlet weak var dessertTableView: UITableView!
    var dessertModel: DessertModel?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        registerCell()
        getDessertResult()
    }
    
    func registerCell(){
        dessertTableView.register(UINib(nibName: DessertTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DessertTableViewCell.identifier)
    }
    
    func getDessertResult(){
        NetworkManager.shared.request(type: DessertModel.self, url: APIs.dessertURL, httpmethod: .get, view: self.view, isAnimate: true, isTokenRequired: false) { result in
            switch result{
            case .success(let response):
                self.dessertModel = response
                DispatchQueue.main.async {
                    self.dessertTableView.reloadData()
                }
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

extension DessertViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return dessertModel?.meals.count ?? 0 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 140 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DessertTableViewCell.identifier, for: indexPath) as! DessertTableViewCell
        cell.mealObject = self.dessertModel?.meals[indexPath.row]
        cell.dessertImage.layer.cornerRadius = 5.0
        cell.dessertImage.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "DessertDetailViewController") as! DessertDetailViewController
        detailVC.mealDetails = dessertModel?.meals[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
