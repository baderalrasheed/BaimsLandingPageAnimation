//
//  LandingPageHelper.swift
//  Baims Landing Page
//
//  Created by Bader Alrasheed on 25/03/2021.
//

import UIKit

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
        
        // MARK: Page Control
        pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 70))
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.center.x = self.view.frame.width / 2
        
        // MARK: Swimming Guy
        swimmingImageView = UIImageView()
        swimmingImageView.center = CGPoint(x: 10000, y: 10000)
        swimmingImageView.frame.size = CGSize(width: 222, height: 219)
        swimmingImageView.image = #imageLiteral(resourceName: "swimming")
        swimmingImageView.contentMode = .scaleToFill
        
        // MARK: Adding Subviews
        self.view.addSubview(backgroundOne)
        self.view.insertSubview(backgroundTwo, belowSubview: backgroundOne)
        self.view.insertSubview(backgroundThree, belowSubview: backgroundTwo)
        self.view.insertSubview(titleOne, aboveSubview: backgroundOne)
        self.view.addSubview(pageControl)
        self.view.addSubview(swimmingImageView)
        
        backgroundOne.translatesAutoresizingMaskIntoConstraints = false
        backgroundTwo.translatesAutoresizingMaskIntoConstraints = false
        backgroundThree.translatesAutoresizingMaskIntoConstraints = false
        titleOne.translatesAutoresizingMaskIntoConstraints
         = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.setupConstraints()
    }
    
    func setupOrigins(parentViewSize: CGSize)
    {
        swimmingOrigin = CGPoint(x: parentViewSize.width - 130, y: parentViewSize.height / 3)
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
        //titleOne.widthAnchor.constraint(lessThanOrEqualToConstant: 308).isActive = true
        titleOne.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 24).isActive = true
        titleOne.trailingAnchor.constraint(greaterThanOrEqualTo: self.view.trailingAnchor, constant: -24).isActive = true
        
        // Page Control
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        
        
    }
}
