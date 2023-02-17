//
//  ProgressBar.swift
//  CircleProgressBarTimer
//
//  Created by Mahmut Senbek on 17.02.2023.
//

import UIKit

class ProgressBar: UIView {

    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
            
    }
    
    var progressColor : UIColor = UIColor.red {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor : UIColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
        
    }
    fileprivate func createCircularPath() {
            self.backgroundColor = UIColor.clear
            self.layer.cornerRadius = self.frame.size.width/2.0
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
                                          radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * Double.pi),
                                          endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
            
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 10.0;
        trackLayer.strokeEnd = 1.0
            layer.addSublayer(trackLayer)
            
            progressLayer.path = circlePath.cgPath
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.strokeColor = progressColor.cgColor
            progressLayer.lineWidth = 10.0;
            progressLayer.strokeEnd = 0.0
            layer.addSublayer(progressLayer)
            
        }
  func setProgressWithAnimation(duration: TimeInterval, value: Float) {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = duration
            // Animate from 0 (no circle) to 1 (full circle)
            animation.fromValue = 0
            animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            progressLayer.strokeEnd = CGFloat(value)
            progressLayer.add(animation, forKey: "animateCircle")
        }

}
