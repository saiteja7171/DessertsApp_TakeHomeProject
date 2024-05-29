

import Foundation
import UIKit

struct Ingredient {
    let name: String
    let measurement: String
}
class IngredientViewModel: NSObject {
    private override init() {}
    static let shared       = IngredientViewModel()
    var selectedIngredient: ((Ingredient) -> Void)?
    var arrIngredients      = [Ingredient]()
    func setupTablview(tablView: UITableView) {
        tablView.dataSource = self
        tablView.delegate   = self
    }
}

extension IngredientViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientAndMeasurementTableViewCell", for: indexPath) as! IngredientAndMeasurementTableViewCell
        let obj = self.arrIngredients[indexPath.row]
        cell.setupData(ingredient: obj.name, measurement: obj.measurement)
        return cell
    }
}

extension IngredientViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIngredient?(self.arrIngredients[indexPath.row])
    }
}
