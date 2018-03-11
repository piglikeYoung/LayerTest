//
//  ViewController4.swift
//  LayerTest
//
//  Created by pike young on 2018/3/4.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        test13_1()
//        test15_1()
    }
    
    func test13_1() {
        let draw = DrawingView(frame: view.bounds)
        view.addSubview(draw)
    }
    
    func test15_1() {
        let blueLayer = CALayer()
        blueLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        blueLayer.contentsCenter = CGRect(x: 0.5, y: 0.5, width: 0, height: 0)
        blueLayer.contentsScale = UIScreen.main.scale
        blueLayer.contents = UIImage(named: "setting_record_novideo")?.cgImage
        view.layer.addSublayer(blueLayer)
    }
}
