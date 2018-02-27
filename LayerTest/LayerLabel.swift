//
//  LayerLabel.swift
//  LayerTest
//
//  Created by pike young on 2018/2/27.
//  Copyright © 2018年 Livestar. All rights reserved.
//

import UIKit

class LayerLabel: UILabel {

    override class var layerClass: AnyClass {
        return CATextLayer.self
    }
    
    private func currentTextLayer() -> CATextLayer {
        return self.layer as! CATextLayer
    }

    func setUp() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUp()
    }
    
    func setText(text: String) {
        super.text = text
        //set layer text
        currentTextLayer().string = text
        currentTextLayer().isWrapped = true
    }
    
    func setTextColor(color: UIColor) {
        super.textColor = color
        //set layer text color
        currentTextLayer().foregroundColor = color.cgColor
    }
    
    func setFont(font: UIFont) {
        super.font = font
        //set layer font
        let fontName = font.fontName
        let fontRef = CGFont(fontName as CFString)
        currentTextLayer().font = fontRef
        currentTextLayer().fontSize = font.pointSize
    }
}
