//
//  TabBarCustomAnimation.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class TabBarCustomAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    let operation: Operation
    
    init(newOperation: Operation) {
        self.operation = newOperation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {return}
        
        containerView.addSubview(toView)
        
        let offset = containerView.frame.width
        toView.frame.origin.x = operation == .toRight ? offset : -offset
        toView.alpha = 0
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                fromView.alpha = 0
                fromView.frame.origin.x = self.operation == .toRight ? -offset : offset
                
                toView.alpha = 1
                toView.frame.origin.x = 0
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
