//
//  ViewController.swift
//  Sample
//
//  Created by ymarui on 2020/06/09.
//  Copyright © 2020 ymarui. All rights reserved.
//

import UIKit
import YMHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapShowAction(_ sender: Any) {
        YMHUD.show()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            YMHUD.dismiss()
        }
    }
}

