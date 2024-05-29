import UIKit

class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    private func initialSetup(){
        layer.backgroundColor   = UIColor.white.cgColor
        layer.cornerRadius      = 10.0
        layer.shadowColor       = UIColor.gray.cgColor
        layer.shadowOffset      = CGSize(width: 0, height: 0)
        layer.shadowRadius      = 3.0
        layer.shadowOpacity     = 0.5
    }
}
