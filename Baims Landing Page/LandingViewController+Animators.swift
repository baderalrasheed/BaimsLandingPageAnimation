//
//  LandingViewController+Animators.swift
//  Baims Landing Page
//
//  Created by Bader Alrasheed on 25/03/2021.
//

import UIKit
import Lottie

extension LandingViewController
{
    func animate()
    {
        switch self.currentPageOfScrollView() {
        case -1...0:
            self.firstAnimation()
        default:
            break
        }
    }
    
    // MARK: Swimming & Airplane Window Animation
    func firstAnimation()
    {
        let swimmingMovementPath = self.view.frame.width-100
        let swimmingRotationPath = -120
        let airplaneWindowMovementPath = self.view.frame.height/2.5
    
        swimmingImageView.layer.position.x = swimmingOrigin.x - CGFloat(percentageOfCurrentPage() * 1.5) * swimmingMovementPath
        swimmingImageView.layer.position.y = swimmingOrigin.y
        
        let currentAngle = atan2f(Float(swimmingImageView.transform.b), Float(swimmingImageView.transform.a))
        let currentDegrees = currentAngle * 180 / Float.pi
        let neededDegrees = Float(swimmingRotationPath) * percentageOfCurrentPage()
        
//        print("needed degrees = \(neededDegrees)")
//        print("current degrees = \(currentDegrees)")
        
        swimmingImageView.rotate(angle: CGFloat(neededDegrees - currentDegrees))
        
        airplaneWindow.center.x = self.view.frame.width/2
        airplaneWindow.center.y = airplaneWindowOriginOne.y + CGFloat(percentageOfCurrentPage() * 1.5) * airplaneWindowMovementPath
        
        if percentageOfCurrentPage() >= 0.8 && airplaneWindow.isAnimationPlaying == false {
            airplaneWindow.play(fromFrame: 14, toFrame: 100, loopMode: .autoReverse)
        }
    }
}

extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
