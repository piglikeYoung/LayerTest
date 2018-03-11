//
//  DrawingView.swift
//  LayerTest
//
//  Created by piglikeyoung on 2018/3/11.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit


class DrawingView: UIView{
    
    let BRUSH_SIZE = 32.0
    
    
//    let path : UIBezierPath?
    
    var strokes: [CGPoint] = []
    
    
    /// test13_2_1
//    override init(frame: CGRect) {
//        path = UIBezierPath()
//        path?.lineJoinStyle = CGLineJoin.round
//        path?.lineCapStyle = CGLineCap.round
//        path?.lineWidth = 5
//        super.init(frame: frame)
//        self.backgroundColor = UIColor.white
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //get the starting point
//        let point = touches.first?.location(in: self)
//
//        //move the path drawing cursor to the starting point
//        path?.move(to: point!)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //get the current point
//        let point = touches.first?.location(in: self)
//
//        //add a new line segment to our path
//        path?.addLine(to: point!)
//
//        //redraw the view
//        setNeedsDisplay()
//    }
//
//    override func draw(_ rect: CGRect) {
//        //draw path
//        UIColor.clear.setFill()
//        UIColor.red.setStroke()
//        path?.stroke()
//    }
    
    /// test13_2_2
//    override class var layerClass: AnyClass {
//        return CAShapeLayer.self
//    }
//
//    override init(frame: CGRect) {
//        //create a mutable path
//        path = UIBezierPath()
//
//        super.init(frame: frame)
//        //configure the layer
//        let shapeLayer = self.layer as! CAShapeLayer
//
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineJoin = kCALineJoinRound
//        shapeLayer.lineCap = kCALineCapRound
//        shapeLayer.lineWidth = 5
//        self.backgroundColor = UIColor.white
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //get the starting point
//        let point = touches.first?.location(in: self)
//
//        //move the path drawing cursor to the starting point
//        path?.move(to: point!)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //get the current point
//        let point = touches.first?.location(in: self)
//
//        //add a new line segment to our path
//        path?.addLine(to: point!)
//
//        //update the layer with a copy of the path
//        (self.layer as! CAShapeLayer).path = path?.cgPath
//    }
    
    /// test13_3_1
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the touch point
        let point = touches.first?.location(in: self)
        
        //add brush stroke
        addBrushStrokeAtPoint(point: point!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //get the touch point
        let point = touches.first?.location(in: self)
        
        //add brush stroke
        addBrushStrokeAtPoint(point: point!)
    }
    
    /// test13_3_1
//    private func addBrushStrokeAtPoint(point: CGPoint) {
//        //add brush stroke to array
//        strokes.append(point)
//
//        //needs redraw
//        setNeedsDisplay()
//    }
    
//    override func draw(_ rect: CGRect) {
//        //redraw strokes
//        for point in strokes {
//            let brushRect = CGRect(x: point.x - CGFloat(BRUSH_SIZE * 0.5), y: point.y - CGFloat(BRUSH_SIZE * 0.5), width: CGFloat(BRUSH_SIZE), height: CGFloat(BRUSH_SIZE))
//
//            //draw brush stroke
//            UIImage(named: "setting_record_novideo")?.draw(in: brushRect)
//        }
//    }
    
    /// test13_3_2
    private func addBrushStrokeAtPoint(point: CGPoint) {
        //add brush stroke to array
        strokes.append(point)
        
        //needs redraw
        setNeedsDisplay(brushRectForPoint(point: point))
    }
    
    private func brushRectForPoint(point: CGPoint) -> CGRect {
        return CGRect(x: point.x - CGFloat(BRUSH_SIZE * 0.5), y: point.y - CGFloat(BRUSH_SIZE * 0.5), width: CGFloat(BRUSH_SIZE), height: CGFloat(BRUSH_SIZE))
    }
    
    override func draw(_ rect: CGRect) {
        //redraw strokes
        for point in strokes {
            let brushRect = brushRectForPoint(point: point)
            
            //only draw brush stroke if it intersects dirty rect
            if rect.intersects(brushRect) {
                UIImage(named: "setting_record_novideo")?.draw(in: brushRect)
            }
        }
    }
}
