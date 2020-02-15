//
//  TabBarCustiomInteractionAnimation.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class TabBarCustiomInteractionAnimation: UIPercentDrivenInteractiveTransition {
    var isInteractive = false
    let tabBarVC: TabBarController
    
    init(newTabBarVC: TabBarController) {
        self.tabBarVC = newTabBarVC
        super.init()
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(pan:)))
        tabBarVC.view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(pan: UIPanGestureRecognizer) {
        let translationX = pan.translation(in: pan.view).x
        let progress = abs(translationX / 200)
        
        switch pan.state {
        case .began:
            isInteractive = true
            if translationX < 0 {
                if tabBarVC.selectedIndex <= tabBarVC.viewControllers!.count - 2 {
                    tabBarVC.selectedIndex += 1
                }
            }
            else {
                if tabBarVC.selectedIndex >= 1 {
                    tabBarVC.selectedIndex -= 1
                }
            }
        case .changed:
            update(progress)
        case .cancelled, .ended:
            isInteractive = false
            if progress > 0.5 {
                finish()
            }
            else {
                cancel()
            }
        default:
            break
        }
    }
}
