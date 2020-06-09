//
//  YMHUD.swift
//  YMHUD
//
//  Created by ymarui on 2020/06/09.
//  Copyright © 2020 ymarui. All rights reserved.
//

import UIKit

public class YMHUD {
    
    static let kuru = UIView()
    static let containerView = UIView()
    static let progressView = ProgressView()

    public static func show() {
        let view: UIView = UIApplication.shared.keyWindow!
        kuru.layer.cornerRadius = 16
        kuru.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        kuru.center = view.center
        kuru.layer.masksToBounds = true
        kuru.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 250/255, alpha: 0.75)
        view.addSubview(kuru)
        
        containerView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        kuru.addSubview(containerView)
        
        progressView.center = containerView.center
        containerView.addSubview(progressView)
    }
    
    public static func dismiss() {
        kuru.removeFromSuperview()
    }
}
