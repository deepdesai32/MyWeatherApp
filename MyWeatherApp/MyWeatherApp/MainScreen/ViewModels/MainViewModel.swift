//
//  MainViewModel.swift
//  MyWeatherApp
//
//  Created by Deep on 2021-06-09.
//  Copyright © 2021 Deep. All rights reserved.
//

import Foundation
import CoreLocation

class MainViewModel  {
    
    var view: MainViewController?
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?
    
    
    func setupLocationManager() {
        locationManager.delegate = view.self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationOfWeather() {
        
        guard let location = userLocation else { return }
        
        let longitude = location.coordinate.longitude
        let latitude = location.coordinate.latitude
        
    }
    
}
