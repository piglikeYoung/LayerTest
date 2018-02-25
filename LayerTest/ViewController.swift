//
//  ViewController.swift
//  LayerTest
//
//  Created by pike young on 2018/2/24.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    
    let blueLayer = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test2_1()
//        test2_2()
//        test3_4()
//        test4_3()
//        test4_6()
//        test5_1()
        test5_2()
    }
    
    func test2_1() {
        let image = UIImage(named: "setting_record_novideo")
        
        layerView.layer.contents = image?.cgImage
//        layerView.layer.contentsGravity = kCAGravityCenter
        layerView.layer.contentsScale = UIScreen.main.scale
        //        layerView.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
//        layerView.layer.contentsCenter = CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)
    }
    
    func test2_2() {
        let bluelayer = CALayer()
        bluelayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        bluelayer.backgroundColor = UIColor.blue.cgColor
        
        bluelayer.delegate = self
        bluelayer.contentsScale = UIScreen.main.scale
        layerView.layer.addSublayer(bluelayer)
        
        bluelayer.display()
    }
    
    func test3_4() {
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
    }
    
    func test4_3() {
        let circlePath = CGPath(ellipseIn: layerView.bounds, transform: nil)
        layerView.backgroundColor = UIColor.clear
        layerView.layer.shadowPath = circlePath
        layerView.layer.shadowOpacity = 0.5
    }
    
    func test4_6() {
        layerView.isHidden = true
        
        //create opaque button
        let button1 = customButton()
        button1.center = CGPoint(x: 50, y: 150)
        self.view.addSubview(button1)
        
        //create translucent button
        let button2 = customButton()
        button2.center = CGPoint(x: 250, y: 150)
        button2.alpha = 0.5
        self.view.addSubview(button2)
        
        //enable rasterization for the translucent button
        button2.layer.shouldRasterize = true
        button2.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func customButton() -> UIButton{
        //create button
        var frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        let button = UIButton(frame: frame)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        
        //add label
        frame = CGRect(x: 20, y: 10, width: 110, height: 30)
        let label = UILabel(frame: frame)
        label.text = "Hello World"
        label.textAlignment = .center
        button.addSubview(label)
        return button
    }
    
    func test5_1() {
//        let transform = CGAffineTransform.identity
        let scaleTransform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        let rotationTransform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi / 180 * 30))
        
        let concat = scaleTransform.concatenating(rotationTransform)
        
        layerView.layer.setAffineTransform(concat)
    }
    
    func test5_2() {
        var transform = CATransform3DMakeRotation(CGFloat(Double.pi / 3), 0, 1, 0)
        transform.m34 = -1.0 / 500.0
        
        layerView.layer.transform = transform
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /// test3_4
//        let point = touches.first!.location(in: view)
//        let layerPoint = layerView.layer.convert(point, from: view.layer)
//        if layerView.layer.contains(layerPoint) {
//            let convertPoint = blueLayer.convert(layerPoint, from: layerView.layer)
//            if blueLayer.contains(convertPoint) {
//                print("Inside Blue Layer")
//            } else {
//                print("Inside White Layer")
//            }
//        }
        
        /// test3_5
//        let point = touches.first!.location(in: view)
//        let layer = layerView.layer.hitTest(point)
//        if layer == blueLayer {
//            print("Inside Blue Layer")
//        } else if layer == layerView.layer {
//            print("Inside White Layer")
//        }
    }
}

extension ViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
