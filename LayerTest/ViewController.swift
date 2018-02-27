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
    @IBOutlet weak var layerLabel: LayerLabel!
    
    let blueLayer = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test2_1()
//        test2_2()
//        test3_4()
//        test4_3()
//        test4_6()
//        test5_1()
//        test5_2()
//        test6_1()
//        test6_1_1()
//        test6_2_1()
//        test6_2_2()
//        test6_3()
//        test6_4_1()
        test6_4_2()
    }
    
    // MARK: - test2
    
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
    
    // MARK: - test3
    
    func test3_4() {
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        layerView.layer.addSublayer(blueLayer)
    }
    
    // MARK: - test4
    
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
    
    // MARK: - test5
    
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
    
    // MARK: - test6
    
    func test6_1() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 100))
        
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path.move(to: CGPoint(x: 150, y: 125))
        path.addLine(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 125, y: 225))
        path.move(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 175, y: 225))
        path.move(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 150))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapButt
        shapeLayer.path = path.cgPath
        layerView.layer.addSublayer(shapeLayer)
    }
    
    func test6_1_1() {
        let rect = CGRect(x: 50, y: 50, width: 100, height: 100)
        let radii = CGSize(width: 20, height: 20)
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: [UIRectCorner.topRight, UIRectCorner.bottomRight, UIRectCorner.bottomLeft], cornerRadii: radii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = bezierPath.cgPath
        layerView.layer.addSublayer(shapeLayer)
    }
    
    func test6_2_1() {
        
        //create a text layer
        let textLayer = CATextLayer()
        textLayer.frame = layerView.bounds
        layerView.layer.addSublayer(textLayer)
        
        //set text attributes
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        textLayer.contentsScale = UIScreen.main.scale
        
        //choose a font
        let font = UIFont.systemFont(ofSize: 15)
        
        //set layer font
        let fontName = font.fontName
        let fontRef = CGFont(fontName as CFString)
        textLayer.font = fontRef
        textLayer.fontSize = font.pointSize
        
        //choose some text
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing \\ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \\ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \\ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \\ lobortis"
        
        //set layer text
        textLayer.string = text
        
    }
    
    func test6_2_2() {
        layerLabel.setText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing \\ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \\ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \\ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \\ lobortis")
        layerLabel.setTextColor(color: UIColor.green)
        
        //choose a font
        let font = UIFont.systemFont(ofSize: 15)
        
        layerLabel.setFont(font: font)
    }
    
    func test6_3() {
        //set up the perspective transform
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        layerView.layer.sublayerTransform = pt
        
        //set up the transform for cube 1 and add it
        let c1t = CATransform3DMakeTranslation(-100, 0, 0)
        let cube1 = cubeWithTransform(c1t)
        layerView.layer.addSublayer(cube1)
        
        //set up the transform for cube 2 and add it
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0);
        c2t = CATransform3DRotate(c2t, CGFloat(-Double.pi / 4), 1, 0, 0);
        c2t = CATransform3DRotate(c2t, CGFloat(-Double.pi / 4), 0, 1, 0);
        let cube2 = cubeWithTransform(c2t)
        layerView.layer.addSublayer(cube2)
        
    }
    
    func faceWithTransform(_ transform: CATransform3D) -> CALayer {
        //create cube face layer
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        //apply a random color
        face.backgroundColor = UIColor.randomColor.cgColor
        
        //apply the transform and return
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(_ transform: CATransform3D) -> CALayer{
        //create cube layer
        let cube = CATransformLayer()
        
        //add cube face 1
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransform(ct))
        
        //add cube face 2
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi * 0.5), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        //add cube face 3
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi * 0.5), 1, 0, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        //add cube face 4
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, CGFloat(-Double.pi * 0.5), 1, 0, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        //add cube face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(-Double.pi * 0.5), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        //add cube face 6
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        //center the cube layer within the container
        let containerSize = layerView.bounds.size
        cube.position = CGPoint(x: containerSize.width * 0.5, y: containerSize.height * 0.5)
        
        //apply the transform and return
        cube.transform = transform
        return cube
    }
    
    func test6_4_1() {
        //create gradient layer and add it to our container view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = layerView.bounds
        layerView.layer.addSublayer(gradientLayer)
        
        //set gradient colors
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        
        //set gradient start and end points
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    func test6_4_2() {
        //create gradient layer and add it to our container view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = layerView.bounds
        layerView.layer.addSublayer(gradientLayer)
        
        //set gradient colors
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
        
        //set locations
        gradientLayer.locations = [0.0, 0.25, 0.5];
        
        //set gradient start and end points
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
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

extension UIColor {
    class var randomColor:UIColor{
        get {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
