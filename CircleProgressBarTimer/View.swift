//
//  View.swift
//  CircleProgressBarTimer
//
//  Created by Mahmut Senbek on 17.02.2023.
//

import UIKit

extension ViewController {
    
     
  static  let timerLabel : UILabel = {
           let label = UILabel()
            label.text = "10"
            label.numberOfLines = 0
            label.textColor = .white
            label.font = .systemFont(ofSize: 25)
            
            
           return label
        }()
        
    
    func style() {
        view.addSubview(ViewController.timerLabel)
        ViewController.timerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            view.centerYAnchor.constraint(equalTo: ViewController.timerLabel.centerYAnchor),
            ViewController.timerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 185),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: ViewController.timerLabel.trailingAnchor)
        
        ])
    }
     
    
}
