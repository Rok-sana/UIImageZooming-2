//
//  ManualVC.swift
//  UIImageZooming
//
//  Created by swstation on 7/31/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit

class ManualVC: UIViewController,UIScrollViewDelegate {
  
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named:"image5.jpg"))
        imageView.isUserInteractionEnabled = true
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        scrollView.contentOffset = CGPoint(x: 550, y: 80)

        scrollView.addSubview(imageView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
      
        
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollViewDoubleTapped(recognizer:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        scrollView.maximumZoomScale = 6.0
      
        scrollView.delegate = self

       
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    @objc func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        
        let point = recognizer.location(in: imageView)
        
        var newZoomScale = scrollView.minimumZoomScale * 1.5
       
        newZoomScale = (scrollView.zoomScale > 1.0) ? 1.0 : newZoomScale
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = point.x - (w / 2.0)
        let y = point.y - (h / 2.0)
        
        let rect = CGRect(x: x, y: y, width: w, height: h)
        
        
        scrollView.zoom(to: rect, animated: true)
        
    }
    

    

}
