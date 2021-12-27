//
//  TaxiAppViewController.swift
//  MyTaxi
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 17/12/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class TaxiAppViewController: UIViewController {

    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationCoordinate2D().latitude, longitude: CLLocationCoordinate2D().longitude, zoom: 3.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        mapView.frame.origin.y = -UIScreen.main.bounds.height/3
        
        
        
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 555)
        label.textAlignment = .center
        label.text = "test label"
        self.view.addSubview(label)
        
        let mapMarker = UIImage(systemName: "mappin.and.ellipse")
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationCoordinate2D().latitude, longitude: CLLocationCoordinate2D().longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    

}
