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
    
    open var logoImage: UIImage?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView(){
        view.backgroundColor = UIColor.primary
        
        let logoView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "FlyForcastLogo")
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
            return imageView;
        }()
        
        view.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}
