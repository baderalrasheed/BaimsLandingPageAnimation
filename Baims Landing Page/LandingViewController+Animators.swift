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
        case 1...2:
            self.thirdAnimation()
        default:
            break
        }
    }
    
    // MARK: Swimming & Airplane Window Animation
    func firstAnimation()
    {
        let percentage = CGFloat(percentageOfCurrentPage())
        let swimmingMovementPath = self.view.frame.width-100
        let swimmingRotationPath = CGFloat(-120)
        let airplaneWindowMovementPath = self.view.frame.height/2.4
    
        swimmingImageView.layer.position.x = swimmingOrigin.x - ( percentage * 1.5 * swimmingMovementPath )
        swimmingImageView.layer.position.y = swimmingOrigin.y
        swimmingImageView.rotateToAngle(degree: CGFloat(swimmingRotationPath) * percentage)
        
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
        let notebookAndCoffeeMovementPath = self.view.frame.height/2.4
        let notebookRotationPath = CGFloat(-45)
        let coffeeRotationPath = CGFloat(115)
        
        airplaneWindow.center.x = airplaneWindowOriginTwo.x - ( percentage * 1.5 * airplaneWindowMovementPath )
        airplaneWindow.center.y = airplaneWindowOriginTwo.y
        
        notebookImageView.layer.position.x = notebookOriginOne.x
        notebookImageView.layer.position.y = notebookOriginOne.y + ( percentage * 1.5 * notebookAndCoffeeMovementPath )
        notebookImageView.rotateToAngle(degree: notebookRotationPath * percentage)
        
        coffeeImageView.layer.position.x = coffeeOriginOne.x
        coffeeImageView.layer.position.y = coffeeOriginOne.y + ( percentage * 1.5 * notebookAndCoffeeMovementPath )
        coffeeImageView.rotateToAngle(degree: coffeeRotationPath * percentage)
        
        backgroundOne.alpha = 1 - percentage
        titleOne.alpha = 1 - ( percentage / 0.3 )
        titleTwo.alpha = 1 - ( ( 1 - percentage ) / 0.5 )
    }
    
    func thirdAnimation()
    {
        let percentage = CGFloat(percentageOfCurrentPage())
        let notebookAndCoffeeMovementPath = self.view.frame.width-200
        let notebookOriginalRotation = CGFloat(-45)
        let coffeeOriginalRotation = CGFloat(115)
        let liveSessionMovementPath = self.view.frame.height/2.4
        
        notebookImageView.layer.position.x = notebookOriginTwo.x - ( percentage * 1.5 * notebookAndCoffeeMovementPath )
        notebookImageView.layer.position.y = notebookOriginTwo.y
        notebookImageView.rotateToAngle(degree: notebookOriginalRotation + 45 * percentage)
        
        coffeeImageView.layer.position.x = coffeeOriginTwo.x + ( percentage * 1.5 * notebookAndCoffeeMovementPath )
        coffeeImageView.layer.position.y = coffeeOriginTwo.y
        coffeeImageView.rotateToAngle(degree: coffeeOriginalRotation - 200 * percentage)
        
        liveSession.center.x = self.view.frame.width/2
        liveSession.center.y = liveSessionOriginOne.y + ( percentage * 1.5 * liveSessionMovementPath )
        
        if percentageOfCurrentPage() >= 0.8 && liveSession.isAnimationPlaying == false {
            liveSession.play(fromFrame: 14, toFrame: 170, loopMode: .autoReverse)
        }
        
        backgroundTwo.alpha = 1 - percentage
        titleTwo.alpha = 1 - ( percentage / 0.3 )
        titleThree.alpha = 1 - ( ( 1 - percentage ) / 0.5 )
    }
}

extension UIView {
    func rotate(degree: CGFloat) {
        let radians = degree / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
    
    func rotateToAngle(degree: CGFloat) {
        let currentAngle = atan2f(Float(self.transform.b), Float(self.transform.a))
        let currentDegrees = CGFloat(currentAngle * 180 / Float.pi)
        self.rotate(degree: degree - currentDegrees)
    }
}
