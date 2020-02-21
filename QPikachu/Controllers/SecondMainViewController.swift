//
//  SecondMainViewController.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class SecondMainViewController: UIViewController {
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundImage.alpha = 0.5
        self.view.layoutIfNeeded()
        let headImageLayer: CALayer = headImage.layer
        headImageLayer.masksToBounds = true
        headImageLayer.cornerRadius = headImage.frame.width / 2
        headImageLayer.borderWidth = 5
        headImageLayer.borderColor = #colorLiteral(red: 0.4882740378, green: 0.6144382954, blue: 0.8381537795, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
}
