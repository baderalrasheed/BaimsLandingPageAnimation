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
        case 0...1:
            self.secondAnimation()
        default:
            break
        }
    }
    
    // MARK: Swimming & Airplane Window Animation
    func firstAnimation()
    {
        let percentage = CGFloat(percentageOfCurrentPage())
        let swimmingMovementPath = self.view.frame.width-100
        let swimmingRotationPath = -120
        let airplaneWindowMovementPath = self.view.frame.height/2.5
    
        swimmingImageView.layer.position.x = swimmingOrigin.x - ( percentage * 1.5 * swimmingMovementPath )
        swimmingImageView.layer.position.y = swimmingOrigin.y
        
        let currentAngle = atan2f(Float(swimmingImageView.transform.b), Float(swimmingImageView.transform.a))
        let currentDegrees = CGFloat(currentAngle * 180 / Float.pi)
        let neededDegrees = CGFloat(swimmingRotationPath) * percentage
        
//        print("needed degrees = \(neededDegrees)")
//        print("current degrees = \(currentDegrees)")
        
        swimmingImageView.rotate(angle: neededDegrees - currentDegrees)
        
        airplaneWindow.center.x = self.view.frame.width/2
        airplaneWindow.center.y = airplaneWindowOriginOne.y + ( percentage * 1.5 * airplaneWindowMovementPath )
        
        if percentageOfCurrentPage() >= 0.8 && airplaneWindow.isAnimationPlaying == false {
            airplaneWindow.play(fromFrame: 14, toFrame: 100, loopMode: .autoReverse)
        }
    }
    
    func secondAnimation()
    {
        let percentage = CGFloat(percentageOfCurrentPage())
        let airplaneWindowMovementPath = self.view.frame.width-100
        
        airplaneWindow.center.x = airplaneWindowOriginTwo.x - ( percentage * 1.5 * airplaneWindowMovementPath )
        airplaneWindow.center.y = airplaneWindowOriginTwo.y
        
        backgroundOne.alpha = 1 - percentage
        titleOne.alpha = 1 - ( percentage / 0.3 ) //1 - ( percentage * 2 )
        titleTwo.alpha = 1 - ( ( 1 - percentage ) / 0.5 )
    }
}

extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}
