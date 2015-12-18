//
//  ViewController.swift
//  PPAlbums
//
//  Created by weifans on 15/12/18.
//  Copyright © 2015年 weifans. All rights reserved.
//

import UIKit

let bound = UIScreen.mainScreen().bounds
let boundW = bound.size.width
let boundH = bound.size.height

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PPAlbums"
        self.automaticallyAdjustsScrollViewInsets = false
        self.albumsScrollView()
        
        let paipou = UILabel(frame: CGRectMake(0, boundH-50, boundW, 50))
        paipou.textAlignment = .Center
        paipou.text = "www.paipou.com"
        self.view.addSubview(paipou)
    }

    func albumsScrollView() {

        scrollView = UIScrollView(frame: CGRectMake(0, 64, boundW, boundW))
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1)
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        self.albumsData()
    }
    
    func albumsData() {
        let pageImages = [UIImage(named:"photo_1")!, UIImage(named:"photo_2")!, UIImage(named:"photo_3")!, UIImage(named:"photo_4")!]
        
        self.photoPage(pageImages)
    }
    
    func photoPage(pageImages: Array<UIImage>) {
        
        let dx:CGFloat = 20
        let itemWidth = boundW + dx * CGFloat(2.0)
        
        for  i in 0..<pageImages.count {
            
            var frame = scrollView.bounds
            frame.origin.x = itemWidth * CGFloat(i)
            frame.origin.y = 0.0
            frame.size.width = itemWidth
            
            let newPageView = UIImageView(image: pageImages[i])
            newPageView.contentMode = UIViewContentMode.ScaleAspectFit
            newPageView.frame = CGRectInset(frame, dx, 0)
            scrollView.addSubview(newPageView)
        }
        scrollView.frame = CGRect(x: -dx, y: 64, width: itemWidth, height: itemWidth)
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(itemWidth * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        self.initAccountPageControl()
    }
    
    func initAccountPageControl() {
        pageControl = UIPageControl()
        pageControl.frame = CGRect(x: 0, y: boundW+64, width: boundW, height: 50)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        self.view.addSubview(pageControl)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let xOffset: CGFloat = scrollView.contentOffset.x
        print(xOffset)
        
        
        if (xOffset < 1.0) {
            pageControl.currentPage = 0
        } else if (xOffset < self.view.bounds.width + 1) {
            pageControl.currentPage = 1
        } else if (xOffset < (self.view.bounds.width*2) + 1) {
            pageControl.currentPage = 2
        }else{
            pageControl.currentPage = 3
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

