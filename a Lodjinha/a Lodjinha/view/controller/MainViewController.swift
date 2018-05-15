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
    private var banners: [ResponseModel.Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModelFactory.create()
        
        self.viewModel?.getBanners()
            .subscribe(onNext: { result in
                self.banners = result!.data
                self.performSegue(withIdentifier: "slide", sender: nil)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let slideViewController = segue.destination as? SlideViewController {
            slideViewController.slideDelegate = self
            slideViewController.banners = self.banners
        }
    }
    
    func pageViewController(pageViewController: SlideViewController, didUpdatePageCount count: Int) {
        if count > 0 {
            self.pageControl.numberOfPages = count
        }
    }
    
    func pageViewController(pageViewController: SlideViewController, didUpdatePageIndex index: Int) {
        self.pageControl.currentPage = index
    }
    
    func getCurrentPageIndex() -> Int {
        return self.pageControl.currentPage
    }

}

