//
//  ViewController.swift
//  LASwift
//
//  Created by Andres Arciniegas on 6/15/16.
//  Copyright © 2016 Andres Arciniegas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView = View()
    let pi = M_PI
    let center = CGPoint(x: UIScreen.mainScreen().bounds.width / 2.0, y: UIScreen.mainScreen().bounds.height / 2.0)
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen.mainScreen().bounds.height
    
    var circleLayer: CAShapeLayer!
    var circleLayerPath: UIBezierPath!
    var smallCircleLayerPath: UIBezierPath!
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layerSetup()
        layerAnimation()
    }
    
//    MARK: Functions
    
    func layerSetup() {
        circleLayer = CAShapeLayer()
        circleLayer.fillColor = UIColor.redColor().CGColor
        circleLayer.strokeColor = UIColor.clearColor().CGColor
        circleLayer.contentsScale = UIScreen.mainScreen().scale
        
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(-2.0 * pi)
        let radius = screenWidth / 2.0
        
        circleLayerPath = UIBezierPath()
        circleLayerPath.addArcWithCenter(center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        circleLayerPath.closePath()
        
        circleLayer.path = circleLayerPath.CGPath
        circleLayer.bounds = CGPathGetPathBoundingBox(circleLayerPath.CGPath)
        circleLayer.position = center
        
        self.mainView.layer.addSublayer(circleLayer)
        
        smallCircleLayerPath = UIBezierPath()
        smallCircleLayerPath.addArcWithCenter(center, radius: radius / 3.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        smallCircleLayerPath.closePath()
    }
    
    func layerAnimation() {
        let beginTime = CACurrentMediaTime()
        
        let pathAnimation1 = CABasicAnimation(keyPath: "path")
        pathAnimation1.toValue = smallCircleLayerPath.CGPath
        pathAnimation1.duration = CFTimeInterval(CGFloat(0.5))
        pathAnimation1.beginTime = beginTime
        pathAnimation1.cumulative = true
        pathAnimation1.additive = true
        pathAnimation1.autoreverses = true
        pathAnimation1.removedOnCompletion = true
        pathAnimation1.repeatCount = .infinity
        pathAnimation1.fillMode = kCAFillModeForwards
        pathAnimation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let colorAnimation1 = CABasicAnimation(keyPath: "fillColor")
        colorAnimation1.toValue = UIColor.whiteColor().CGColor
        colorAnimation1.duration = CFTimeInterval(CGFloat(0.2))
        colorAnimation1.beginTime = beginTime
        colorAnimation1.cumulative = true
        colorAnimation1.additive = true
        colorAnimation1.autoreverses = true
        colorAnimation1.removedOnCompletion = true
        colorAnimation1.repeatCount = .infinity
        colorAnimation1.fillMode = kCAFillModeForwards
        colorAnimation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        
        circleLayer.addAnimation(pathAnimation1, forKey: nil)
        circleLayer.addAnimation(colorAnimation1, forKey: nil)
    }


}

