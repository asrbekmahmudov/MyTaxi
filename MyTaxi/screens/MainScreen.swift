//
//  MainScreen.swift
//  MyTaxi
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 17/12/21.
//

import UIKit
import GoogleMaps
import Pulsator

class MainScreen: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
   // @IBOutlet var label: UILabel!
    @IBOutlet var mapView: UIView!
    @IBOutlet var marker: UIImageView!
    @IBOutlet var addressView: UIView!
    @IBOutlet var screen: UIView!
    @IBOutlet var address: UILabel!
    @IBOutlet var lableView: UIView!
    @IBOutlet var gotoView: UIView!
    @IBOutlet var gotoButton: UIButton!
    @IBOutlet var menuView: UIView!
    public var longitude: Double = 69.28178410
    public var latitude: Double = 41.31057820
    var camera = GMSCameraPosition()
    var GoogleMapView:GMSMapView!
    var geoCoder:CLGeocoder!
    let pulsator = Pulsator()
    let markerSize: CGFloat = 50
    var menuButton = UIButton()
    var isMenuOpened = true
    var menuOverAll = UIView()
    var isPushed = false

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    
    // MARK: - Set Up View
    
    func setUp() {
        self.SetUpMap()
        setMenu()
        setAddressView()
        setPulsator()
        setMarker()
        geoCoder = CLGeocoder()
    }
    
    func setMenuView() {
        menuScreen()
    }
    
    func setMenu() {
        menuButton = UIButton(frame: CGRect(x: UIScreen.height/46.5, y: UIScreen.height/15.5, width: 40, height: 40))
        menuButton.layer.shadowRadius = 5
        menuButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        menuButton.layer.shadowOpacity = 0.1
        menuButton.layer.cornerRadius = 20
        menuButton.layer.borderColor = UIColor.systemGray4.cgColor
        menuButton.layer.borderWidth = 0.5
        menuButton.setImage(UIImage(named: "menu"), for: .normal)
        menuButton.backgroundColor = .white
        menuButton.setTitleColor(UIColor.black, for: .normal)
        menuButton.addTarget(self, action: #selector(self.menuTapped), for: .touchUpInside)
        screen.addSubview(menuButton)
    }
    
    func setAddressView() {
        addressView.layer.cornerRadius = 10
        (lableView.layer.cornerRadius, gotoView.layer.cornerRadius) = (10, 10)
        (lableView.layer.maskedCorners, gotoView.layer.maskedCorners) = ([.layerMaxXMinYCorner, .layerMinXMinYCorner], [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        gotoButton.layer.cornerRadius = 10
        gotoButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
    }
    
    func setPulsator() {
        pulsator.backgroundColor = UIColor.systemBlue.cgColor
        pulsator.numPulse = 3
        pulsator.frame.origin.x = UIScreen.width/2
        pulsator.frame.origin.y = UIScreen.height/2
        screen.layer.addSublayer(pulsator)
    }
    
    func setMarker() {
        marker.frame.origin.x = (UIScreen.width - markerSize)/2
        marker.frame.origin.y = UIScreen.height/2 - markerSize
    }
    
    func changeAfterOpenedMenu() {
        screen.frame.origin.x = UIScreen.width - UIScreen.width/5
        screen.frame.origin.y = 70
        screen.layer.shadowRadius = 10
        screen.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        screen.layer.shadowOpacity = 0.1
        GoogleMapView.layer.cornerRadius = 20
        screen.layer.cornerRadius = 20
        mapView.layer.cornerRadius = 20
        setMenuView()
    }
    
    func changeAfterClosedMenu() {
        menuOverAll.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        GoogleMapView.layer.cornerRadius = 0
        screen.frame.origin.x = 0
        screen.frame.origin.y = 0
    }
    
    
    
    // MARK: - MAP View
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.pulsator.stop()
        isMenuOpened = false
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        self.pulsator.start()
    }

    func call() {
        let vc = TripHistory(nibName: "TripHistory", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func SetUpMap(){
        camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
        GoogleMapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height - addressView.frame.height), camera: camera)
        GoogleMapView.delegate = self
        self.mapView.addSubview(GoogleMapView)
        self.mapView.bringSubviewToFront(marker)
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        pulsator.start()
        
        let lat = position.target.latitude
        let lng = position.target.longitude
    
        let location = CLLocation(latitude: lat, longitude: lng)
        
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.address.text = placemarks?.first?.name!
        }
    }
    
    // MARK: - Menu Screen
    func menuScreen() {
        menuOverAll.frame = CGRect(x: 0, y: 100, width: UIScreen.width*3/4, height: UIScreen.height/2)
        menuOverAll.backgroundColor = UIColor.black
        menuView.addSubview(menuOverAll)
        profileView()
        if !isPushed {
            sections()
            isPushed = true
        }
    }
    
    func profileView() {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.width * 3/4, height: 100))
        background.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        background.layer.cornerRadius = 10
        
        // Set Image
        let image = UIImage(named: "profileImage")?.withRoundedCorners(radius: UIScreen.height/2)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame.origin.x = (background.frame.size.height - UIScreen.width/6) / 2
        imageView.frame.origin.y = (background.frame.size.height - UIScreen.width/6) / 2
        imageView.frame.size.width = UIScreen.width/6
        imageView.frame.size.height = UIScreen.width/6
        imageView.image = image
        
        // Set Name, Phone
        let name = UILabel(frame: CGRect(x: imageView.frame.size.height + imageView.frame.origin.x + 10, y: imageView.frame.origin.y + 5, width: background.frame.size.width - imageView.frame.size.width - 10, height: 18))
        name.text = "Elon Musk"
        name.font = .systemFont(ofSize: 18, weight: .medium)
        name.textColor = .white
        
        let phone = UILabel(frame: CGRect(x: imageView.frame.size.height + imageView.frame.origin.x + 10, y: imageView.frame.origin.y + name.frame.origin.y + 18, width: background.frame.size.width - imageView.frame.size.width - 10, height: 14))
        phone.text = "+998121234567"
        phone.font = .systemFont(ofSize: 14)
        phone.textColor = .gray
        
        // Stack
//        var VStack = UIStackView()
//        VStack.frame.origin.x = 0
//        VStack.frame.origin.y = 0
//        VStack.frame.size.width = 20
//        VStack.axis = .vertical
//        VStack.distribution  = UIStackView.Distribution.equalSpacing
//        VStack.spacing = 10
//
//        VStack.addArrangedSubview(name)
//        VStack.addArrangedSubview(phone)
//
        background.addSubview(name)
        background.addSubview(phone)
        
        background.addSubview(imageView)
        menuOverAll.addSubview(background)
    }
    
    
    func sections() {
        let images: [String] = ["paperplane", "wallet.pass", "star.fill"]
        let texts: [String] = ["Мои поездки", "Способы оплаты", "Избранные адреса"]
        var spacing = 25
        for index in 0..<3 {
            let button = UIButton.init(type: .system)
            button.frame = CGRect(x: 20, y: Int(menuOverAll.frame.size.height)/4 + spacing, width: Int(UIScreen.width)*3/4, height: 25)
            button.setImage(UIImage(systemName: images[index])?.maskWithColor(color: UIColor.red), for: .normal)
            button.setTitle(texts[index], for: .normal)
            button.setTitleColor(.systemGray4, for: .normal)
            button.tintColor = UIColor.systemGray2
            button.contentHorizontalAlignment = .left
            button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            if index == 0 {
                button.addTarget(self, action: #selector(self.menu(_ :)), for: .touchUpInside)
            }
            //button.imageEdgeInsets.left = -10
            if index == 1 {
                button.titleEdgeInsets.left = 14
            } else {
                button.titleEdgeInsets.left = 10
            }
            spacing += 50
            menuOverAll.addSubview(button)
        }
    }
    
    // MARK: - Action
    @objc func menu(_ : UIButton) {
        print("ooo")
        call()
        isMenuOpened = false
        changeAfterClosedMenu()
    }
    
    @objc func menuTapped() {
        isMenuOpened = !isMenuOpened
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: { [self] in
            if isMenuOpened {
                changeAfterOpenedMenu()
            } else {
                changeAfterClosedMenu()
            }
        })
    }
    
}
