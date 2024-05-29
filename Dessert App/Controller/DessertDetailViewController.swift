import UIKit
import Kingfisher
import AVKit
import AVFoundation
import SafariServices


class DessertDetailViewController: UIViewController {

    @IBOutlet weak var youTubeButton: UIButton!
    @IBOutlet weak var tblIngredientInfo: ContentSizedTableView!
    @IBOutlet weak var Recipe: UITextView!
    @IBOutlet weak var DessertOrigin: UILabel!
    @IBOutlet weak var DessertImage: UIImageView!
    @IBOutlet weak var DessertHeading: UILabel!
    
    var mealDetails : Meals?
    var recipeModel : DessertDetailModel?
    var ingredientViewModel = IngredientViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubeButton.setTitle("", for: .normal)
        let youTubeImage = UIImage(named: "yt")
        youTubeButton.setImage(youTubeImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        detailScreenAPI()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func detailScreenAPI(){
        let url = APIs.mealDetails + "\(String(describing: mealDetails?.idMeal ?? " "))"
        NetworkManager.shared.request(type: DessertDetailModel.self, url: url, httpmethod: .get, view: self.view, isAnimate: true, isTokenRequired: false) { result in
            switch result{
            case .success(let response):
                self.recipeModel = response
                DispatchQueue.main.async {
                    self.DessertHeading.text = self.recipeModel?.meals[0].strMeal
                    self.DessertImage.kf.setImage(with: self.recipeModel?.meals[0].strMealThumb?.asURL, placeholder: UIImage(named: "LoadingImage"))
                    self.DessertOrigin.text = self.recipeModel?.meals[0].strArea
                    self.Recipe.text = self.recipeModel?.meals[0].strInstructions
                    self.Recipe.translatesAutoresizingMaskIntoConstraints = true
                    self.Recipe.sizeToFit()
                    self.Recipe.isScrollEnabled       = false
                    self.Recipe.isEditable            = false
                    self.Recipe.smartInsertDeleteType = .no
                    self.ingredientViewModel.arrIngredients = self.recipeModel?.meals[0].arrIngredients ?? []
                    self.ingredientViewModel.setupTablview(tablView: self.tblIngredientInfo)
                    self.youTubeButton.addTarget(self, action: #selector(self.youTubeButtonTapped(sender:)), for: .touchUpInside)
                }
                return
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    
    
    @objc func youTubeButtonTapped(sender: UIButton){
        
        //Below code is for the Video coming from external server
        let indexPath      = IndexPath(row: sender.tag, section: 1)
        let videoURLString = self.recipeModel?.meals[indexPath.row].strYoutube ?? " "
        // ensuring that url is valid or not
        guard let videoURl = URL(string: videoURLString) else{
            print("invalid Video URL")
            return
        }
        let YouTubeVC = self.storyboard?.instantiateViewController(identifier: "YouTubeViewController") as! YouTubeViewController
        YouTubeVC.myVideoURL = videoURl
        self.navigationController?.pushViewController(YouTubeVC, animated: true)
    }
    
    @IBAction func moreInfoTap(sender: UIButton) {
        guard let sourceURl = self.recipeModel?.meals[0].strSource, let url = URL(string: sourceURl) else {
            return
        }
        let sv = SFSafariViewController(url: url)
        sv.modalPresentationStyle = .fullScreen
        self.present(sv, animated: true)
    }
        
    
}
