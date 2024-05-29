
import UIKit

class IngredientAndMeasurementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblIngredient: UILabel!
    @IBOutlet weak var lblMeasurement: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupData(ingredient: String, measurement: String) {
        self.lblIngredient.text     = ingredient
        self.lblMeasurement.text    = measurement
    }
    

}
