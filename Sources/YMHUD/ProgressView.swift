//
//  ProgressView.swift
//  YMHUD
//
//  Created by ymarui on 2020/06/10.
//  Copyright © 2020 ymarui. All rights reserved.
//

import UIKit

final class ProgressView: UIView {
    
    static let defalutProgressViewLineWidth: CGFloat = 2
    static let defaultProgressViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48))

    init() {
        super.init(frame: ProgressView.defaultProgressViewFrame)
        clipsToBounds = false
        
        let radius = (ProgressView.defaultProgressViewFrame.width - ProgressView.defalutProgressViewLineWidth) / 2
        
        let circleLayer1 = CAShapeLayer()
        circleLayer1.frame = frame
        circleLayer1.contentsScale = UIScreen.main.scale
        circleLayer1.strokeColor = UIColor.black.cgColor
        circleLayer1.fillColor = UIColor.clear.cgColor
        circleLayer1.lineWidth = ProgressView.defalutProgressViewLineWidth
        circleLayer1.lineCap = .round
        circleLayer1.lineJoin = .round
        circleLayer1.strokeStart = 0
        circleLayer1.strokeEnd = 0.4
        circleLayer1.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false).cgPath
        
        let circleLayer2 = CAShapeLayer()
        circleLayer2.frame = frame
        circleLayer2.contentsScale = UIScreen.main.scale
        circleLayer2.strokeColor = UIColor.black.cgColor
        circleLayer2.fillColor = UIColor.clear.cgColor
        circleLayer2.lineWidth = ProgressView.defalutProgressViewLineWidth
        circleLayer2.lineCap = .round
        circleLayer2.lineJoin = .round
        circleLayer2.strokeStart = 0.4
        circleLayer2.strokeEnd = 1
        circleLayer2.path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false).cgPath
         
        let gradLayer = CAGradientLayer()
        gradLayer.frame = frame
        gradLayer.startPoint = CGPoint(x: 0, y: 0.5);
        gradLayer.endPoint = CGPoint(x: 1, y: 0.5);
        gradLayer.colors = [
            UIColor.black.cgColor,
            UIColor.black.withAlphaComponent(0.5).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor,
        ]
        gradLayer.locations = [
            0,
            0.5,
            0.95
        ]
        gradLayer.mask = circleLayer2
        
        layer.addSublayer(circleLayer1)
        layer.addSublayer(gradLayer)
        
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = Double.pi*2
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
        animation.fillMode = .forwards
        animation.autoreverses = false
        layer.add(animation, forKey: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
