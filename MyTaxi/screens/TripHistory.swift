
import UIKit

class TripHistory: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func call() {
        let vc = TripDetail(nibName: "TripDetail", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var items: Array<Data> = Array()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = Bundle.main.loadNibNamed("DataTableViewCell", owner: self, options: nil)?.first as! DataTableViewCell
        
        cell.from.text = item.from
        cell.goto.text = item.goto
        cell.image.image = UIImage(named: item.carImg!)!
        cell.time.text = item.time
        cell.selectionStyle = .none
        if indexPath.last! == 0 {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            cell.addGestureRecognizer(tap)
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        navigation()
        items.append(Data(from: "Tashkent, Uzbekistan", goto: "Tashkent, Uzbekistan", time: "21:36 - 22:12", carImg: "car1"))
        items.append(Data(from: "Kichik Xalqa yo'li street", goto: "Tashkent, Uzbekistan", time: "14:40 - 15:00", carImg: "car2"))
        items.append(Data(from: "Muqimiy Street", goto: "Tashkent, Uzbekistan", time: "12:00 - 12:19", carImg: "car3"))
    }
    
    func navigation() {
        title = "Trip History"
    }
    
    // MARK: - Action
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        call()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
