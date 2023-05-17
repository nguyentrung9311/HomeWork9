//
//  TilesView.swift
//  HomeWork9
//
//  Created by Nguyen Trung on 5/17/23.
//

import UIKit

@IBDesignable
class TileView: UIView {
    let layerRect = CAShapeLayer()
    let layerShadowLeft = CAShapeLayer()
    let layerShadowTop = CAShapeLayer()
    let layerShadowRight = CAShapeLayer()
    let layerShadowBottom = CAShapeLayer()
    
    var tilePoints = [CGPoint]()
    var viewPoints = [CGPoint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initShape(frame: frame)
        initColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initShape(frame: frame)
        initColor()
    }
    
    func initColor() {
        layerRect.fillColor = #colorLiteral(red: 1, green: 0.4705882353, blue: 0.2039215686, alpha: 1)
        layerShadowLeft.fillColor = #colorLiteral(red: 1, green: 0.8039215686, blue: 0.6274509804, alpha: 1)
        layerShadowTop.fillColor = #colorLiteral(red: 1, green: 0.7058823529, blue: 0.4784313725, alpha: 1)
        layerShadowRight.fillColor = #colorLiteral(red: 0.7882352941, green: 0.3019607843, blue: 0.1725490196, alpha: 1)
        layerShadowBottom.fillColor = #colorLiteral(red: 0.8823529412, green: 0.368627451, blue: 0.1411764706, alpha: 1)
    }
    
    func initShape(frame: CGRect) {
        viewPoints.append(CGPoint(x: 0, y: 0))
        viewPoints.append(CGPoint(x: frame.width, y: 0))
        viewPoints.append(CGPoint(x: frame.width, y: frame.height))
        viewPoints.append(CGPoint(x: 0, y: frame.height))
        
        let shadowMargin = frame.width * 0.12
        tilePoints.append(CGPoint(x: shadowMargin, y: shadowMargin))
        tilePoints.append(CGPoint(x: frame.width - shadowMargin, y: shadowMargin))
        tilePoints.append(CGPoint(x: frame.width - shadowMargin, y: frame.height - shadowMargin))
        tilePoints.append(CGPoint(x: shadowMargin, y: frame.height - shadowMargin))
        
        let rectPath = UIBezierPath()
        rectPath.move(to: tilePoints[0])
        rectPath.addLine(to: tilePoints[1])
        rectPath.addLine(to: tilePoints[2])
        rectPath.addLine(to: tilePoints[3])
        layerRect.path = rectPath.cgPath
        
        let shadowLeftPath = UIBezierPath()
        shadowLeftPath.move(to: viewPoints[0])
        shadowLeftPath.addLine(to: viewPoints[3])
        shadowLeftPath.addLine(to: tilePoints[3])
        shadowLeftPath.addLine(to: tilePoints[0])
        layerShadowLeft.path = shadowLeftPath.cgPath
        
        let shadowTopPath = UIBezierPath()
        shadowTopPath.move(to: viewPoints[0])
        shadowTopPath.addLine(to: viewPoints[1])
        shadowTopPath.addLine(to: tilePoints[1])
        shadowTopPath.addLine(to: tilePoints[0])
        layerShadowTop.path = shadowTopPath.cgPath
        
        let shadowRightPath = UIBezierPath()
        shadowRightPath.move(to: viewPoints[1])
        shadowRightPath.addLine(to: viewPoints[2])
        shadowRightPath.addLine(to: tilePoints[2])
        shadowRightPath.addLine(to: tilePoints[1])
        layerShadowRight.path = shadowRightPath.cgPath
        
        let shadowBottomPath = UIBezierPath()
        shadowBottomPath.move(to: viewPoints[2])
        shadowBottomPath.addLine(to: viewPoints[3])
        shadowBottomPath.addLine(to: tilePoints[3])
        shadowBottomPath.addLine(to: tilePoints[2])
        layerShadowBottom.path = shadowBottomPath.cgPath
        
        layer.addSublayer(layerRect)
        layer.addSublayer(layerShadowLeft)
        layer.addSublayer(layerShadowTop)
        layer.addSublayer(layerShadowRight)
        layer.addSublayer(layerShadowBottom)
    }
}
