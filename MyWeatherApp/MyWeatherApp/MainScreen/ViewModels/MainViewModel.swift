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
    let APIKey = "b5158caf6efc945577b4789b2f1b356b"
    
    var lat: String?
    var long: String?
    
    var namedLocation: String?
    
    func setupLocationManager() {
        locationManager.delegate = view.self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func fetchUserLocation() {
        guard let location = userLocation else { return }
        
        lat = "\(location.coordinate.latitude)"
        long = "\(location.coordinate.longitude)"
        
        _ = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let _ = country, error == nil else { return }
            self.namedLocation = city
            
            DispatchQueue.main.async {
                self.view?.setupViews()
            }
        }
    }
    
    func fetchWeatherData(completion: @escaping ((Result<WeatherData, Error>) -> ())) {
        
        guard let latitude = lat, let longitude = long else {return}
        
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,alerts&appid=\(APIKey)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherData.self, from: data!)
                
                completion(.success(weatherInfo))
                
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
        }.resume()
    }
    
    func populateWeatherData() {
        fetchWeatherData { (result) in
            switch result {
            case .success(let weather):
                print(weather.current.clouds)
            case .failure(let error):
                print("Failed to fetch data:", error)
            }
        }
    }
    
}
