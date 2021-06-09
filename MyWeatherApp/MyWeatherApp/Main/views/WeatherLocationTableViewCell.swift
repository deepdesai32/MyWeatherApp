//
//  WeatherLocationTableViewCell.swift
//  MyWeatherApp
//
//  Created by Deep on 2021-06-09.
//  Copyright © 2021 Deep. All rights reserved.
//

import Foundation
import UIKit

class WeatherLocationTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        self.tintColor = .white
        setupCellView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView() {
        
   }
    
  
}
