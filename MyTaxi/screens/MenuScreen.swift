
import UIKit
import Foundation

class MenuScreen: UIView {
    var generalView = UIView()
    var username: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadFromNib() -> UIView {
        print("ooo")
                    let bundle = Bundle(for: type(of: self))
                    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
                    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
                    return view
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.generalView.backgroundColor = UIColor.white
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.generalView.backgroundColor = UIColor.gray
    }
    
    func setUp() {
        generalView.frame = CGRect(x: 20, y: 120, width: UIScreen.width/2, height: UIScreen.height/2)
        generalView.backgroundColor = UIColor.green
        var button = UIButton(type: .system)
        button.frame.size.width = 100
        button.frame.size.height = 100
        //UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        button.addTarget(self, action: #selector(self.historyScreen), for: .touchUpInside)
        button.setTitleColor(UIColor.red, for: .normal)
        
        button.backgroundColor = UIColor.white
        button.setTitle("Screen", for: .normal)
        generalView.addSubview(button)
        addSubview(generalView)
    }

    @objc func historyScreen() {
        var vc = TripHistory(nibName: "TripHistory", bundle: nil)
        UIViewController().navigationController?.pushViewController(vc, animated: true)
    }
    
    
    deinit {
        print("deinit starts")
    }
    
}
