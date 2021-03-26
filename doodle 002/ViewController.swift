//
//  ViewController.swift
//  doodle 002
//
//  Created by Jason M Davis on 12/5/20.
//
import MapKit
import UIKit
import CoreLocation


class MapScreen: UIViewController  {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        // Do any additional setup after loading the view.
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
            } else {
            // show alert to let user know they need to turn this on
        }
    
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied:
            // show alert to show them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
    
}

extension MapScreen: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    //
        }
    }

