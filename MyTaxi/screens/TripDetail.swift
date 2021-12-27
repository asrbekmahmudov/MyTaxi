
import UIKit
import GoogleMaps

class TripDetail: UIViewController, GMSMapViewDelegate {

    var mapView:GMSMapView!
    var uiview = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height))
    var originY = CGFloat()
    var bottomSheetOpened = false
    let bottomSheetVC = TripDetailBottomSheet()
    override func viewDidLoad() {
        super.viewDidLoad()
        originY = UIScreen.height*8/10
        let camera = GMSCameraPosition.camera(withLatitude: 41.31057820, longitude: 69.28178410, zoom: 16.0)
        mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height), camera: camera)
        drawRectange()
        mapView.delegate = self
        self.uiview.addSubview(mapView)
        view.addSubview(uiview)
        addBottomSheetView()
        setBackButton()
    }
    
    func setBackButton() {
        let backButton = UIButton(frame: CGRect(x: 20, y: 50, width: 40, height: 40))
        backButton.layer.shadowRadius = 5
        backButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        backButton.layer.shadowOpacity = 0.1
        backButton.layer.cornerRadius = 25
        backButton.layer.borderColor = UIColor.systemGray4.cgColor
        backButton.layer.borderWidth = 0.5
        backButton.setImage(UIImage(named: "backButton"), for: .normal)
        backButton.backgroundColor = .white
        backButton.setTitleColor(UIColor.black, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func drawRectange(){
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 41.31057820, longitude: 69.28178410))
        path.add(CLLocationCoordinate2D(latitude: 41.310578, longitude: 69.281784))
        path.add(CLLocationCoordinate2D(latitude: 41.3109, longitude: 69.281))
        path.add(CLLocationCoordinate2D(latitude: 41.3112, longitude: 69.2851))
        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .blue
        polyline.strokeWidth = 5.0
        polyline.map = mapView
    }
    
    func addBottomSheetView() {
        self.addChild(bottomSheetVC)
        self.view.addSubview(bottomSheetVC.view)
        bottomSheetVC.didMove(toParent: self)

        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetVC.view.frame = CGRect(x: 0, y: originY, width: width, height: height)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        bottomSheetOpened = !bottomSheetOpened
        print(bottomSheetOpened)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: { [self] in
            if bottomSheetOpened {
                originY = 50
            } else {
                originY = UIScreen.height*8/10
            }
            addBottomSheetView()
        })
    }
    

}
