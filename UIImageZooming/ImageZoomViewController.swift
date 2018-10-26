//
//  ViewController.swift
//  UIImageZooming
//
//  Created by swstation on 7/30/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit


class ImageZoomViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        imageView = UIImageView(image: UIImage(named: "foodTest.png"))
        imageView.isUserInteractionEnabled = true
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        
        scrollView.contentOffset = CGPoint(x: 560, y: 470)
        scrollView.addSubview(imageView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        //scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollViewDoubleTapped(recognizer:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        
        scrollView.addGestureRecognizer(doubleTapRecognizer)
        
        scrollView.minimumZoomScale = 0.185
        
        scrollView.maximumZoomScale = 2.0
        scrollView.zoomScale = 0.1
        scrollView.delegate = self
        
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    @objc func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        
        let point = recognizer.location(in: imageView)
        
        var newZoomScale = scrollView.zoomScale * 1.5
        
        newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
        newZoomScale = (newZoomScale == scrollView.maximumZoomScale) ? scrollView.minimumZoomScale : newZoomScale
        
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = point.x - (w / 2.0)
        let y = point.y - (h / 2.0)
        
        let rect = CGRect(x: x, y: y, width: w, height: h)
        
        
        scrollView.zoom(to: rect, animated: true)
        
    }
    
}

