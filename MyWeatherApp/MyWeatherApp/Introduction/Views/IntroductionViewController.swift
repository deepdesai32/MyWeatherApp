//
//  IntroductionViewController.swift
//  MyWeatherApp
//
//  Created by Deep on 2020-06-04.
//  Copyright © 2020 Deep. All rights reserved.
//

import Foundation
import UIKit

open class IntroductionViewController: UIViewController {
    
    open var proceedButton: UIButton?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        proceedButton?.addTarget(self, action: #selector(enterPressed(_:)), for: .touchUpInside)
    }
    
    @objc func enterPressed(_ button: UIButton) {
        print("Test")
    }
    
    //setting up introduction view: Logo and Button
    func setupView(){
        view.backgroundColor = UIColor.primary
        
        let logoView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "FlyForecastLogo")
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
            return imageView
        }()

        let enterButton: UIButton = {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            button.setTitle("Enter", for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        view.addSubview(logoView)
        view.addSubview(enterButton)
        
        NSLayoutConstraint.activate([
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor),
            logoView.heightAnchor.constraint(equalToConstant: logoView.image?.size.height ?? 500)
        ])
        
        NSLayoutConstraint.activate([

            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            enterButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.bottomAnchor.constraint(equalToSystemSpacingBelow: logoView.bottomAnchor, multiplier: 2.0)
        ])
        
        proceedButton = enterButton
    }
    
    //making the view portrait only for all devices
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
            return .portrait
    }
}
