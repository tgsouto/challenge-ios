//
//  ViewController.swift
//  a Lodjinha
//
//  Created by Priscila Marques on 5/10/18.
//  Copyright © 2018 Tiago Souto. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, SlideViewControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    
    private var viewModel: MainViewModel?
    private var homeList: [[Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModelFactory.create()
        
        self.viewModel?.getBanners()
            .subscribe(onNext: { result in
                homeList.append(contentsOf: result.data)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let slideViewController = segue.destination as? SlideViewController {
            slideViewController.slideDelegate = self
        }
    }
    
    func pageViewController(slidePageViewController: SlideViewController, didUpdatePageCount count: Int) {
        self.pageControl.numberOfPages = count
    }
    
    func pageViewController(slidePageViewController: SlideViewController, didUpdatePageIndex index: Int) {
        self.pageControl.currentPage = index
    }
    
    func getCurrentPageIndex() -> Int {
        return self.pageControl.currentPage
    }

}

