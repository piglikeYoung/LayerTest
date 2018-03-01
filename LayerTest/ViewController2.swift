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
    
    var colorLayer2: CALayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test7_4()
        test8_1_3()
    }
    
    @IBAction func changeColorClicked(_ sender: Any) {
//        test7_1()
//        test7_2()
//        test7_3_1()
//        test7_3_2()
//        test7_3_3()
//        test8_1_1()
//        test8_1_2()
//        test8_1_3()
        test8_1_4()
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
    
    func test7_4() {
        let layer = CALayer()
        layer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
        colorLayer2 = layer
    }
    
    // test7_4
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the touch point
        let point = touches.first?.location(in: view)
        
        //check if we've tapped the moving layer
        if ((colorLayer2?.presentation()?.hitTest(point!)) != nil) {
            //randomize the layer background color
            colorLayer2?.backgroundColor = UIColor.randomColor.cgColor
        } else {
            //otherwise (slowly) move the layer to new position
            CATransaction.begin()
            CATransaction.setAnimationDuration(4)
            colorLayer2?.position = point!
            CATransaction.commit()
        }
    }
    
    func test8_1_1() {
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.toValue = UIColor.randomColor.cgColor
        animation.delegate = self
        colorLayer.add(animation, forKey: nil)
    }
    
    func test8_1_2() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 10
        animation.values = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.green.cgColor, UIColor.purple.cgColor]
        colorLayer.add(animation, forKey: nil)
    }
    
    func test8_1_3() {
        let shipLayer = CALayer()
        shipLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        shipLayer.position = CGPoint(x: 150, y: 150)
        shipLayer.contents = UIImage(named: "Digits")?.cgImage
        layerView.layer.addSublayer(shipLayer)
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform"
        animation.duration = 2.0
        animation.toValue = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 0, 1)
        shipLayer.add(animation, forKey: nil)
    }
    
    func test8_1_4() {
        let shipLayer = CALayer()
        shipLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        shipLayer.position = CGPoint(x: 150, y: 150)
        shipLayer.contents = UIImage(named: "Digits")?.cgImage
        layerView.layer.addSublayer(shipLayer)
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = 2.0
        animation.toValue = Double.pi * 2
        shipLayer.add(animation, forKey: nil)
    }
}

extension ViewController2: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        colorLayer.backgroundColor = (anim as! CABasicAnimation).toValue as! CGColor
        CATransaction.commit()
    }
}
