//
//  SlideViewController.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import UIKit

class SlideViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var banners: [ResponseModel.Banner] = []
    
    private lazy var bannersViewController: [UIViewController] = instantiateViews()
    
    weak var slideDelegate: SlideViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let bannerController = viewController as! BannerViewController
        let index = bannerController.index
        self.slideDelegate?.slidePageViewController(slidePageViewController: self, didUpdatePageIndex: index)
        if index == 0 {
            return nil
        } else {
            return self.bannersViewController[index - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let bannerController = viewController as! BannerViewController
        let index = bannerController.index
        self.slideDelegate?.slidePageViewController(slidePageViewController: self, didUpdatePageIndex: index)
        if index == (self.banners.count - 1) {
            return nil
        } else {
            return self.bannersViewController[index + 1]
        }
    }
    
    private func instantiateViews () -> [UIViewController] {
        var views: [UIViewController] = []
        
        for (index, banner) in self.banners.enumerated() {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "banner") as? BannerViewController
            viewController?.banner = banner
            viewController?.index = index
            views.append(viewController!)
        }
        
        return views
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SlideViewControllerDelegate: class {
    func slidePageViewController(slidePageViewController: SlideViewController, didUpdatePageCount count: Int)
    func slidePageViewController(slidePageViewController: SlideViewController, didUpdatePageIndex index: Int)
    func getCurrentPageIndex () -> Int
}
