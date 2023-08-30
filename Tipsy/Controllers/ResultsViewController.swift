
import UIKit

class ResultsViewController: UIViewController {
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingsLabel.text = "Счёт разделён между \(split) персонами, включая \(tip)% чаевых."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
//        переход на начальный экран
        self.dismiss(animated: true, completion: nil)
    }
    
}
