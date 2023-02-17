//
//  ViewController.swift
//  CircleProgressBarTimer
//
//  Created by Mahmut Senbek on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar()
        createButton()
    }
    
    func createButton() {
        let startButton : UIButton = {
            let button = UIButton(type: UIButton.ButtonType.system)
            button.setTitle("Start", for: UIControl.State.normal)
            button.setTitleColor(.red, for: UIControl.State.normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 40 / 2
            return button
            
        }()
        view.addSubview(startButton)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(animateProgress), for: UIControl.Event.touchUpInside)
        NSLayoutConstraint.activate([
        
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: startButton.trailingAnchor, constant: 20),
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.widthAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    func progressBar() {
        let circularProgress = ProgressBar(frame: CGRect(x: 10.0, y: 30.0, width: 100, height: 100))
        circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        circularProgress.trackColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 0.6)
        circularProgress.tag = 101
        circularProgress.center = self.view.center
        self.view.addSubview(circularProgress)
        
        //animate progress
       // self.perform(#selector(animateProgress), with: nil, afterDelay: 1)
    }
    
    @objc func animateProgress() {
          let cp = self.view.viewWithTag(101) as! ProgressBar
        cp.setProgressWithAnimation(duration: 5, value: 1)
      }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

}
