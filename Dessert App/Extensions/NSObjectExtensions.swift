

import Foundation
import UIKit

extension NSObject {
    func showActivityIndicator (view: UIView) -> UIActivityIndicatorView {
            let activityIndicator               = UIActivityIndicatorView(style: .medium)
            activityIndicator.color             = .black
            activityIndicator.center            = view.center
            activityIndicator.hidesWhenStopped  = true
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)
            return activityIndicator
        }
        func removeActivityIndicator(indicator: UIActivityIndicatorView) {
            DispatchQueue.main.async {
                indicator.stopAnimating()
            }
        }
}
