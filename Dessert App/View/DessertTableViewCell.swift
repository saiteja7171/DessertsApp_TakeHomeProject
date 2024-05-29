

import UIKit
import Kingfisher

class DessertTableViewCell: UITableViewCell {

    static let identifier = String(describing: DessertTableViewCell.self)
    
    @IBOutlet weak var dessertName: UILabel!
    @IBOutlet weak var dessertImage: UIImageView!
    
    var mealObject : Meals?{
        didSet {
            dessertName.text = mealObject?.strMeal
            dessertImage.kf.setImage(with: mealObject?.strMealThumb.asURL, placeholder: UIImage(named: "LoadingImage"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
