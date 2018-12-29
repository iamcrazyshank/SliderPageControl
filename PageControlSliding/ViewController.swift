//
//  ViewController.swift
//  PageControlSliding
//
//  Created by Shashank Chandran on 12/28/18.
//  Copyright © 2018 Shashank Chandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewAccessibilityDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func skipButton(_ sender: Any) {
   
    }
    var images :[String] = ["1","2","3"]
    
    var frame = CGRect(x:0,y:0,width:0,height:0)
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        //Number of pages
        pageControl.numberOfPages = images.count
        for  index in 0..<images.count
        {
            //frame size using the scroll view (width will be number of images * one scrollview width
        frame.origin.x = scrollView.frame.size.width * CGFloat(index)
        frame.size = scrollView.frame.size
        //assign the image to it
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imageView)
           
        }
        //width of the scrollview using the frame
        scrollView.contentSize = CGSize(width:(scrollView.frame.size.width * CGFloat(images.count) ), height: (scrollView.frame.size.height) )
         scrollView.delegate = self
    }

//for page controller for page count
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNo = scrollView.contentOffset.x / frame.size.width
        pageControl.currentPage = Int(pageNo)
        
        
    }
    
}

//Border for button
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

