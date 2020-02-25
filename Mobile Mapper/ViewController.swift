//
//  ViewController.swift
//  Mobile Mapper
//
//  Created by Mariam Fuzail on 2/24/20.
//  Copyright © 2020 Mariam Fuzail. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let barringtonAnnotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude = 42.15704
        let longitude = -88.14812
        let coordinate =
            CLLocationCoordinate2DMake(latitude, longitude)
        let address = "Mount Rushmore"
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            for placemark in placemarks! {
            let annotation = MKPointAnnotation()
            annotation.coordinate = (placemark.location?.coordinate)!
            annotation.title = placemark.name
            self.mapView.addAnnotation(annotation)
            }
        }
        
        barringtonAnnotation.coordinate = coordinate
        barringtonAnnotation.title = "Barrington High School"
        mapView.addAnnotation(barringtonAnnotation)
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
    }
}

    
