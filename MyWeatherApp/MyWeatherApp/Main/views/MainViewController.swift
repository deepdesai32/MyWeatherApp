//
//  MainViewController.swift
//  MyWeatherApp
//
//  Created by Deep on 2021-06-09.
//  Copyright © 2021 Deep. All rights reserved.
//

import Foundation
import UIKit

open class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var table: UITableView?
    
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary
    }
    
    func setupViews() {
        
        let tableview: UITableView = {
            let table = UITableView()
            table.backgroundColor = .clear
            table.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()
   
        tableview.register(WeatherLocationTableViewCell.self, forCellReuseIdentifier: "cellId")
       
        view.addSubview(tableview)
       
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
       
        table?.delegate = self
        table?.dataSource = self
        
        self.table = tableview
    
    }

}

extension MainViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}


