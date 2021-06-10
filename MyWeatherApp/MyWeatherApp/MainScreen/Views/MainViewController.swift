//
//  MainViewController.swift
//  MyWeatherApp
//
//  Created by Deep on 2021-06-09.
//  Copyright © 2021 Deep. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

open class MainViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView?
    var viewModel: MainViewModel?

    open override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        viewModel?.view = self
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel?.setupLocationManager()
    }
    
    func setupViews() {
        
        let tableView: UITableView = {
            let table = UITableView()
            table.backgroundColor = .white
            table.translatesAutoresizingMaskIntoConstraints = false
            table.separatorStyle = .none
            return table
        }()
   
        tableView.register(WeatherLocationTableViewCell.self, forCellReuseIdentifier: "cellId")
       
        view.addSubview(tableView)
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView = tableView
    
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, viewModel?.userLocation == nil {
            viewModel?.userLocation = locations.first
            viewModel?.locationManager.stopUpdatingLocation()
            viewModel?.fetchUserLocation()
            viewModel?.populateWeatherData()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! WeatherLocationTableViewCell
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let weatherCell = cell as? WeatherLocationTableViewCell
        weatherCell?.setup(row: indexPath.row, city: viewModel?.namedLocation, currentWeather: viewModel?.currentWeather)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    

}
