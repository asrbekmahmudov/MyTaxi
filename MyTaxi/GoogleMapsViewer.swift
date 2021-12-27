//
//  GoogleMapsViewer.swift
//  MyTaxi
//
//  Created by Mahmudov Asrbek Ulug'bek o'g'li on 17/12/21.
//

import UIKit
import GoogleMaps

class GoogleMapsViewer: UIViewController, CLLocationManagerDelegate {

    //Outlets
        @IBOutlet var MapView: GMSMapView!

        //Variables
        var locationManager = CLLocationManager()

        override func viewDidLoad() {
            super.viewDidLoad()

            initializeTheLocationManager()
            self.MapView?.isMyLocationEnabled = false
        }

        func initializeTheLocationManager() {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            var location = locationManager.location?.coordinate

            cameraMoveToLocation(toLocation: location)

        }

        func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
            if toLocation != nil {
                MapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
            }
        }

}
