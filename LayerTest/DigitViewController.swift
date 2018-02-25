//
//  DigitViewController.swift
//  LayerTest
//
//  Created by pike young on 2018/2/25.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class DigitViewController: UIViewController {

    @IBOutlet var digitViews: [UIView]!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let digits = UIImage(named: "Digits")
        
        for subView in digitViews {
            subView.layer.contents = digits?.cgImage
            subView.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.1, height: 1.0)
            subView.layer.contentsGravity = kCAGravityResizeAspect
            subView.layer.magnificationFilter = kCAFilterNearest
        }

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(test4_5_tick), userInfo: nil, repeats: true)
        
        test4_5_tick()
    }

    @objc func test4_5_tick() {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponents = calendar.dateComponents([.hour, .minute, .second], from: Date())
        
        //set hours
        setDigit(UInt(dateComponents.hour! / 10), forView: digitViews[0])
        setDigit(UInt(dateComponents.hour! % 10), forView: digitViews[1])
        
        //set minutes
        setDigit(UInt(dateComponents.minute! / 10), forView: digitViews[2])
        setDigit(UInt(dateComponents.minute! % 10), forView: digitViews[3])
        
        //set seconds
        setDigit(UInt(dateComponents.second! / 10), forView: digitViews[4])
        setDigit(UInt(dateComponents.second! % 10), forView: digitViews[5])
    }
    
    func setDigit(_ digit: UInt, forView: UIView) {
        forView.layer.contentsRect = CGRect(x: Double(digit) * 0.1, y: 0, width: 0.1, height: 1.0)
    }
}
