import UIKit

class ViewController: UIViewController {
    
    /*
    @objc func userTookScreenshot()
    {
        let alert = UIAlertController(title: "Screenshot", message:" User took screenshot", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    */

    @IBOutlet weak var label: UILabel! {
        didSet {
            label.accessibilityIdentifier = "HelloLable"
        }
    }
    @IBOutlet weak var button: UIButton!
    
    @IBAction func generate(_ sender: Any) {
        // Generate amount
        let amount = Double.random(in: 100 ..< 99999999)

        // Format
        if let formattedAmount = CurrencyHelper.format(amount: amount as NSNumber) {
            label.attributedText = CurrencyHelper.attributify(amount: formattedAmount)
        }
    }
}
