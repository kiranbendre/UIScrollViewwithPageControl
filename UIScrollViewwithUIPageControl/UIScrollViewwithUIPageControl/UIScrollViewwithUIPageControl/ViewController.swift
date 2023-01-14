//
//  ViewController.swift
//  UIScrollViewwithUIPageControl
//
//  Created by Iphone XR on 04/01/23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[Slide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 33.0/255, green: 40.0/255, blue: 64.0/255, alpha: 1.0)
        
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "HPImg")
        slide1.titleLabel.text = "HP Laptop"
        slide1.locationLabel.text = "kothrud ,pune"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "XiaomiImg")
        slide2.titleLabel.text = "Xiomi laptop"
        slide2.locationLabel.text = "Hadapsar, pune"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "DellImg")
        slide3.titleLabel.text = "Dell laptop"
        slide3.locationLabel.text = "pimpri,pune"
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imageView.image = UIImage(named: "lenovaImg")
        slide4.titleLabel.text = "Lenovo laptop"
        slide4.locationLabel.text = "Baner,pune"
        
        
        let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide5.imageView.image = UIImage(named: "AppleImg")
        slide5.titleLabel.text = "Apple laptop"
        slide5.locationLabel.text = "Vimannagar,pune"
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        
        scrollView.frame = CGRect(x: 0, y: 100, width:view.frame.width , height: 300)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 300)
        scrollView.backgroundColor = UIColor(red: 63.0/255, green: 70.0/255, blue: 100.0/255, alpha: 1.0)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    //MARK:-
    // default function called when view is scolled. In order to enable callback
    // when scrollview is scrolled, the below code needs to be called:
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y

        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
//
//                let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
//
//
//                        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//
//                            slides[0].imageView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//                            slides[1].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//
//                        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//                            slides[1].imageView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//                            slides[2].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
        
//                        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//                            slides[2].imageView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//                            slides[3].imageView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//                        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//                                    slides[3].imageView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//                                    slides[4].imageView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
//                                }
        
            }
    
    }

