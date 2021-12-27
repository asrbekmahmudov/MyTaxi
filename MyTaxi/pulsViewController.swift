
import UIKit
import Pulsator

class pulsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pulsator = Pulsator()
        pulsator.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
        pulsator.numPulse = 3
        pulsator.frame.origin.x = 100
        pulsator.frame.origin.y = 500
        view.layer.addSublayer(pulsator)
        pulsator.start()
        // Do any additional setup after loading the view.
    }

}
