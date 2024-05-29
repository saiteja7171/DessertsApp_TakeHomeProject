import UIKit

class DessertViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    @IBOutlet weak var dessertTableView: UITableView!
    var dessertModel: DessertModel?
    var filteredDesserts: [Meals] = []
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureSearchController()
        getDessertResult()
    }
    
    func registerCell() {
        dessertTableView.register(UINib(nibName: DessertTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DessertTableViewCell.identifier)
    }
    
    func getDessertResult() {
        NetworkManager.shared.request(type: DessertModel.self, url: APIs.dessertURL, httpmethod: .get, view: self.view, isAnimate: true, isTokenRequired: false) { result in
            switch result {
            case .success(let response):
                self.dessertModel = response
                self.filteredDesserts = response.meals
                DispatchQueue.main.async {
                    self.dessertTableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a dessert"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
}

extension DessertViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDesserts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DessertTableViewCell.identifier, for: indexPath) as! DessertTableViewCell
        cell.mealObject = filteredDesserts[indexPath.row]
        cell.dessertImage.layer.cornerRadius = 5.0
        cell.dessertImage.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(identifier: "DessertDetailViewController") as! DessertDetailViewController
        detailVC.mealDetails = filteredDesserts[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension DessertViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            filteredDesserts = dessertModel?.meals ?? []
            dessertTableView.reloadData()
            return
        }
        
        filteredDesserts = dessertModel?.meals.filter { meal in
            return meal.strMeal.lowercased().contains(searchText.lowercased())
        } ?? []
        
        dessertTableView.reloadData()
    }
}
