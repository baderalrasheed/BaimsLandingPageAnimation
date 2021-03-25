//
//  LandingPageHelper.swift
//  Baims Landing Page
//
//  Created by Bader Alrasheed on 25/03/2021.
//

import UIKit
import Lottie

extension LandingViewController
{
    func setupViews()
    {
        // MARK: Backgrounds
        backgroundOne = UIView(frame: self.view.frame)
        backgroundOne.backgroundColor = UIColor(red: 0, green: 0.808, blue: 0.796, alpha: 1)
        backgroundOne.isUserInteractionEnabled = false
        
        backgroundTwo = UIView(frame: self.view.frame)
        backgroundTwo.backgroundColor = UIColor(red: 0.682, green: 0.549, blue: 0.8, alpha: 1)
        backgroundTwo.isUserInteractionEnabled = false
        
        backgroundThree = UIView(frame: self.view.frame)
        backgroundThree.backgroundColor = UIColor(red: 0.451, green: 0.745, blue: 0.91, alpha: 1)
        backgroundThree.isUserInteractionEnabled = false
        
        // MARK: Labels
        titleOne = UILabel()
        titleOne.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        titleOne.numberOfLines = 2
        titleOne.text = "Study wherever you are,\nwhenever you want"
        titleOne.textColor = .white
        titleOne.textAlignment = .center
        
        titleTwo = UILabel()
        titleTwo.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        titleTwo.numberOfLines = 2
        titleTwo.text = "Videos based on your\ncollege’s curriculum"
        titleTwo.textColor = .white
        titleTwo.textAlignment = .center
        titleTwo.alpha = 0
        
        titleThree = UILabel()
        titleThree.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        titleThree.numberOfLines = 2
        titleThree.text = "Live sessions with\nthe best instructors!"
        titleThree.textColor = .white
        titleThree.textAlignment = .center
        titleThree.alpha = 0
        
        // MARK: Page Control
        pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 70))
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.center.x = self.view.frame.width / 2
        pageControl.isUserInteractionEnabled = false
        
        // MARK: Swimming Guy
        swimmingImageView = UIImageView(image: #imageLiteral(resourceName: "swimming"))
        swimmingImageView.center = CGPoint(x: 10000, y: 10000)
        swimmingImageView.frame.size = CGSize(width: 222, height: 219)
        swimmingImageView.contentMode = .scaleToFill
        
        
        // MARK: Airplane Window
        airplaneWindow = .init(name: "AirplaneWindow")
        airplaneWindow.center = self.airplaneWindowOriginOne
        airplaneWindow.frame.size = CGSize(width: 300, height: 300)
        airplaneWindow.contentMode = .scaleAspectFit
        airplaneWindow.loopMode = .playOnce
        airplaneWindow.stop()
        airplaneWindow.isUserInteractionEnabled = false
        
        // MARK: Notebook
        notebookImageView = UIImageView(image: #imageLiteral(resourceName: "notebook"))
        notebookImageView.center = notebookOriginOne
        notebookImageView.frame.size = CGSize(width: 180, height: 260)
        notebookImageView.contentMode = .scaleAspectFill
        
        // MARK: Coffee
        coffeeImageView = UIImageView(image: #imageLiteral(resourceName: "coffee"))
        coffeeImageView.frame.origin = coffeeOriginOne
        coffeeImageView.frame.size = CGSize(width: 95, height: 90)
        coffeeImageView.contentMode = .scaleAspectFill
        
        // MARK: Live Session
        liveSession = .init(name: "LiveSessionAnimation")
        liveSession.center = self.liveSessionOriginOne
        liveSession.frame.size = CGSize(width: 300, height: 300)
        liveSession.contentMode = .scaleAspectFit
        liveSession.loopMode = .playOnce
        liveSession.stop()
        liveSession.isUserInteractionEnabled = false
        
        
        // MARK: Adding Subviews
        self.view.addSubview(backgroundOne)
        self.view.insertSubview(backgroundTwo, belowSubview: backgroundOne)
        self.view.insertSubview(backgroundThree, belowSubview: backgroundTwo)
        self.view.addSubview(titleOne)
        self.view.addSubview(titleTwo)
        self.view.addSubview(titleThree)
        self.view.addSubview(pageControl)
        self.view.addSubview(swimmingImageView)
        self.view.addSubview(airplaneWindow)
        self.view.addSubview(notebookImageView)
        self.view.addSubview(coffeeImageView)
        self.view.addSubview(liveSession)
        
        backgroundOne.translatesAutoresizingMaskIntoConstraints = false
        backgroundTwo.translatesAutoresizingMaskIntoConstraints = false
        backgroundThree.translatesAutoresizingMaskIntoConstraints = false
        titleOne.translatesAutoresizingMaskIntoConstraints = false
        titleTwo.translatesAutoresizingMaskIntoConstraints = false
        titleThree.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupConstraints()
    }
    
    func setupOrigins(parentViewSize: CGSize)
    {
        swimmingOrigin = CGPoint(x: parentViewSize.width - 130, y: parentViewSize.height / 3)
        
        airplaneWindowOriginOne = CGPoint(x: parentViewSize.width / 2, y: -250)
        airplaneWindowOriginTwo = CGPoint(x: airplaneWindowOriginOne.x, y: airplaneWindowOriginOne.y + 1.5 * parentViewSize.height/2.4)
        
        notebookOriginOne = CGPoint(x: ( parentViewSize.width / 2 ) - 40, y: -250)
        coffeeOriginOne = CGPoint(x: notebookOriginOne.x + 120, y: -270)
        
        notebookOriginTwo = CGPoint(x: notebookOriginOne.x, y: notebookOriginOne.y + ( 1.5 * parentViewSize.height/2.4 ))
        coffeeOriginTwo = CGPoint(x: coffeeOriginOne.x, y: coffeeOriginOne.y + ( 1.5 * parentViewSize.height/2.4 ))
        
        liveSessionOriginOne = CGPoint(x: parentViewSize.width / 2, y: -250)
        liveSessionOriginTwo = CGPoint(x: liveSessionOriginOne.x, y: liveSessionOriginOne.y + 1.5 * parentViewSize.height/2.4)
    }
    
    func setupConstraints()
    {
        // Backgrounds
        let backgrounds = [backgroundOne, backgroundTwo, backgroundThree]
        
        for background in backgrounds
        {
            background!.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            background!.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
            background!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            background!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
        // Labels
        titleOne.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44).isActive = true
        titleOne.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleOne.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 24).isActive = true
        titleOne.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        titleTwo.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44).isActive = true
        titleTwo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleTwo.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 24).isActive = true
        titleTwo.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        titleThree.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: -44).isActive = true
        titleThree.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleThree.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 24).isActive = true
        titleThree.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        // Page Control
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        
    }
}
