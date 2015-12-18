//
//  ViewController.swift
//  PPAlbums
//
//  Created by weifans on 15/12/18.
//  Copyright © 2015年 weifans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.albumsScrollView()
    }

    func albumsScrollView() {
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.pagingEnabled = true
        scrollView.backgroundColor = UIColor.whiteColor()
        view.addSubview(scrollView)
        
        self.albumsData()
    }
    
    func albumsData() {
        let pageImages = [UIImage(named:"photo_1")!, UIImage(named:"photo_2")!, UIImage(named:"photo_3")!, UIImage(named:"photo_4")!]
        
        self.photoPage(pageImages)
    }
    
    func photoPage(pageImages: Array<UIImage>) {
        
        let dx:CGFloat = 20
        let itemWidth = scrollView.bounds.width + dx * CGFloat(2.0)
        
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
        let tt = view.bounds.size
        scrollView.frame = CGRect(x: -dx, y: 0, width: itemWidth, height: tt.height)
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(itemWidth * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

