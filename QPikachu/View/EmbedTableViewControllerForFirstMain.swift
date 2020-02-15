//
//  EmbedTableViewControllerForFirstMain.swift
//  QPikachu
//
//  Created by 张雨飞 on 8/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class EmbedTableViewControllerForFirstMain: UITableViewController {
    
    @IBOutlet weak var recordImage: UIImageView!
    
    @IBOutlet weak var teachingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordImage.alpha = 0.6
        teachingImage.alpha = 0.6
    }
    
}
