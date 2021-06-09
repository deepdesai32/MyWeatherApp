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
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            self.present(mainViewController, animated: true, completion: nil)
        })
    }
    
    
    //setting up introduction view: Logo
    func setupView(){
        view.backgroundColor = UIColor.primary
        
        let logoView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "FlyForecastLogo")
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
            return imageView
        }()
        
        view.addSubview(logoView)
        
        NSLayoutConstraint.activate([
            logoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor),
            logoView.heightAnchor.constraint(equalToConstant: logoView.image?.size.height ?? 500)
        ])
    }
}
