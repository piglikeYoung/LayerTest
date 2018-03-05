//
//  ViewController3.swift
//  LayerTest
//
//  Created by pike young on 2018/3/4.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    var ballIV: UIImageView?
    
    lazy var colorLayer: CALayer = {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.position = CGPoint(x: view.bounds.size.width * 0.5, y: view.bounds.size.height * 0.5)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
        return layer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        test10_2_1()
        test10_2_2()
    }
    
    func test10_1_1(_ touches: Set<UITouch>) {
        //configure the transaction
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        //set the position
        self.colorLayer.position = touches.first!.location(in: view)
        //commit transaction
        CATransaction.commit()
        
        //        let animation = CABasicAnimation(keyPath: "position")
        //        animation.toValue = touches.first!.location(in: view)
        //        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        //        colorLayer.add(animation, forKey: nil)
    }
    
    func test10_1_2() {
        //create a keyframe animation
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.duration = 2.0
        animation.values = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        //add timing function
        let fn = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.timingFunctions = [fn, fn, fn]
        //apply animation to layer
        colorLayer.add(animation, forKey: nil)
    }
    
    func test10_2_1() {
        //create timing function
//        let function = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let function = CAMediaTimingFunction(controlPoints: 1, 0, 0.75, 1)
        
        //get control points
        var controlPoint1: [Float] = [0.0, 0.0]
        var controlPoint2: [Float] = [0.0, 0.0]
        function.getControlPoint(at: 1, values: &controlPoint1)
        function.getControlPoint(at: 2, values: &controlPoint2)
        //create curve
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addCurve(to: CGPoint(x: 1, y: 1), controlPoint1: CGPoint(x: Double(controlPoint1[0]), y: Double(controlPoint1[1])), controlPoint2: CGPoint(x: Double(controlPoint2[0]), y: Double(controlPoint2[1])))
        //scale the path up to a reasonable size for display
        path.apply(CGAffineTransform.init(scaleX: 200, y: 200))
        //create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        //flip geometry so that 0,0 is in the bottom-left
        view.layer.isGeometryFlipped = true
    }
    
    func test10_2_2() {
        let ballImage = UIImage(named: "setting_record_novideo")
        ballIV = UIImageView(image: ballImage)
        view.addSubview(ballIV!)
        //animate
        animate()
    }
    
    func animate() {
        //reset ball to top of screen
        ballIV?.center = CGPoint(x: 150, y: 32)
        //set up animation parameters
        let fromValue = CGPoint(x: 150, y: 32)
        let toValue = CGPoint(x: 150, y: 268)
        let duration = 1.0
        //generate keyframes
        let numFrames = Int(duration * 60)
        var frames: [CGPoint] = []
        for i in 1..<numFrames {
            let time = 1.0 / Double(numFrames * i)
            frames.append(interpolateFromValue(fromValue: fromValue, toValue: toValue, time: time))
        }
        //create keyframe animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1.0
//        animation.delegate = self
        animation.values = frames
        //apply animation
        ballIV?.layer.add(animation, forKey: nil)
    }
    
    func interpolate(from: Double, to: Double, time: Double) -> Double {
        let result = (to - from) * time + from
        print("from: \(from), to:\(to), time:\(time), result: \(result)")
        return result
    }
    
    func interpolateFromValue(fromValue: CGPoint, toValue:CGPoint, time: Double) -> CGPoint {
        let result = CGPoint(x: interpolate(from: Double(fromValue.x), to: Double(toValue.x), time: time), y: interpolate(from: Double(fromValue.y), to: Double(toValue.y), time: time))
        return result
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        test10_1_1(touches)
//        test10_1_2()
        animate()
    }

}
