import UIKit


extension UIViewController {
    @objc func userTookScreenshot()
    {
        let alert = UIAlertController(title: "Screenshot", message: "User took screenshot", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
