//
//  ViewController2.swift
//  LayerTest
//
//  Created by pike young on 2018/2/28.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var layerView: UIView!
    
    lazy var colorLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        layer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(layer)
        return layer
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeColorClicked(_ sender: Any) {
//        test7_1()
//        test7_2()
//        test7_3_1()
//        test7_3_2()
        test7_3_3()
    }
    
    func test7_1() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        CATransaction.commit()
    }
    
    func test7_2() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        CATransaction.setCompletionBlock {
            var transform = self.colorLayer.affineTransform()
            transform = transform.concatenating(CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 4)))
            self.colorLayer.setAffineTransform(transform)
        }
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        CATransaction.commit()
    }
    
    func test7_3_1() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        layerView.layer.backgroundColor = UIColor.randomColor.cgColor
        CATransaction.commit()
    }
    
    func test7_3_2() {
        //test layer action when outside of animation block
        print("Outside: %@", layerView.action(for: layerView.layer, forKey: "backgroundColor"))
        //begin animation block
        UIView.beginAnimations(nil, context: nil)
        //test layer action when inside of animation block
        print("Inside: %@", layerView.action(for: layerView.layer, forKey: "backgroundColor"))
        //end animation block
        UIView.commitAnimations()
    }
    
    func test7_3_3() {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        colorLayer.actions = ["backgroundColor": transition]
        
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
    }
}
