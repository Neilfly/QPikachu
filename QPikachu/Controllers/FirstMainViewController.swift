//
//  FirstMainViewController.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit
import AVKit

class FirstMainViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    // MARK: - 视频播放功能
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = AVPlayer(url: Bundle.main.url(forResource: "SwimmingVideo", withExtension: "mp4")!)
        
        let playerVC = AVPlayerViewController()
        playerVC.player = player
        addChild(playerVC)
        playerVC.view.frame = videoView.bounds
        videoView.addSubview(playerVC.view)
        playerVC.didMove(toParent: self)
    }
    
}
