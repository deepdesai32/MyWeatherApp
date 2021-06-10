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
    
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .primary
        view.isOpaque = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let currentLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Baskerville-Bold", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Baskerville-SemiBold", size: 16)
        label.textColor = .systemGray6
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Baskerville-SemiBold", size: 16)
        label.textColor = .systemGray6
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Baskerville-Bold", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Sunny")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.tintColor = .white
        setupCellView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView() {
        addSubview(cellView)
        cellView.addSubview(currentLocationLabel)
        cellView.addSubview(secondaryLabel)
        cellView.addSubview(descriptionLabel)
        cellView.addSubview(tempLabel)
        cellView.addSubview(weatherImage)
        
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentLocationLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            currentLocationLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            currentLocationLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            currentLocationLabel.widthAnchor.constraint(equalToConstant: 10),
            currentLocationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            secondaryLabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 2),
            secondaryLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            secondaryLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            secondaryLabel.widthAnchor.constraint(equalToConstant: 10),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 16),
            
            weatherImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            weatherImage.leadingAnchor.constraint(equalTo: currentLocationLabel.centerXAnchor, constant: 40),
            weatherImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            weatherImage.widthAnchor.constraint(equalToConstant: 10),
            weatherImage.heightAnchor.constraint(equalToConstant: 50),
            
            tempLabel.leadingAnchor.constraint(equalTo: currentLocationLabel.centerXAnchor, constant: 85),
            tempLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            tempLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -2),
            tempLabel.widthAnchor.constraint(equalToConstant: 10),
            tempLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    func setup(row: Int, city: String?, currentWeather: Current?) {
        
        if row == 0 {
            currentLocationLabel.text = "My Location"
            secondaryLabel.text = city
        } else {
            currentLocationLabel.text = city
        }
        
        guard let description = currentWeather?.weather[0].weatherDescription.rawValue, let temp = currentWeather?.temp else {return}
        
        descriptionLabel.text = description
        weatherImage.image = UIImage(named: description)
        tempLabel.text = Int(temp).description + "°"
    }
    
  
}
