//
//  TabBarController.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

enum Operation {
    case toRight, toLeft
}

class TabBarController: UITabBarController {
    
    var tabBarCustomInteraction: TabBarCustiomInteractionAnimation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarCustomInteraction = TabBarCustiomInteractionAnimation(newTabBarVC: self)
        
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = tabBarController.viewControllers!.firstIndex(of: fromVC)!
        let toIndex = tabBarController.viewControllers!.firstIndex(of: toVC)!
        
        let operation: Operation = toIndex > fromIndex ? .toRight : .toLeft
        
        return TabBarCustomAnimation(newOperation: operation)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return tabBarCustomInteraction.isInteractive ? tabBarCustomInteraction : nil
    }
}
