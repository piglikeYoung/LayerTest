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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test2_1()
//        test2_2()
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

}

extension ViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        ctx.setLineWidth(10)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.strokeEllipse(in: layer.bounds)
    }
}
