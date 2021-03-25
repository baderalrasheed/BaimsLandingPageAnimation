//
//  ViewController.swift
//  Baims Landing Page
//
//  Created by Bader Alrasheed on 25/03/2021.
//

import UIKit
import Lottie

class LandingViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: Origins
    var swimmingOrigin : CGPoint!
    var airplaneWindowOriginOne : CGPoint!
    var airplaneWindowOriginTwo : CGPoint!
    
    // MARK: Views
    var backgroundOne : UIView!
    var backgroundTwo : UIView!
    var backgroundThree : UIView!
    var pageControl : UIPageControl!
    var titleOne : UILabel!
    var swimmingImageView : UIImageView!
    var airplaneWindow : AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        self.setupOrigins(parentViewSize: self.view.frame.size)
        self.setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        scrollView.contentOffset.x = -150
        scrollView.setContentOffset(CGPoint.zero, animated: true)
    }

    func currentPageOfScrollView() -> Int
    {
        return Int(floor(self.scrollView.contentOffset.x/self.view.frame.width))
    }
    
    func percentageOfCurrentPage() -> Float
    {
        var currentPage = currentPageOfScrollView()
        
        if currentPage < 0 {
            currentPage = 0
        }
        else if currentPage >= 5 {
            currentPage = 4
        }
        
        let maxOffsetForCurrentPage = CGFloat(currentPage + 1) * self.view.frame.width
        let minOffsetForCurrentPage = CGFloat(currentPage) * self.view.frame.width
        
        let contentOffsetWithRespectToCurrentPage = self.scrollView.contentOffset.x - minOffsetForCurrentPage
        
        let percentage = contentOffsetWithRespectToCurrentPage / ( maxOffsetForCurrentPage - minOffsetForCurrentPage )
        
        return Float(percentage)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setupOrigins(parentViewSize: size)
        scrollView.contentOffset.x += 1
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 500)) {
            self.scrollView.scrollRectToVisible(CGRect(x: CGFloat(self.currentPageOfScrollView()) * size.width, y: 0, width: size.width, height: 1), animated: false)
        }
    }
}

extension LandingViewController: UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("current page = \(self.currentPageOfScrollView()) & percentage = \(self.percentageOfCurrentPage())")
        
        self.animate()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = self.currentPageOfScrollView()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.pageControl.currentPage = self.currentPageOfScrollView()
    }
}
