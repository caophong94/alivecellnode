//
//  DismissingSellerViewAnimator.swift
//  StillAliveNode
//
//  Created by Dung Nguyen on 10/8/16.
//  Copyright © 2016 Stay Hungry. All rights reserved.
//

import UIKit

class DismissingSellerViewAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var startFrame: CGRect!
    var startBackgroundColor: UIColor!
    var logoBackgroundView: UIView!
    
    init(startFrame: CGRect, startBackgroundColor: UIColor) {
        super.init()
        self.startFrame = startFrame
        self.startBackgroundColor = startBackgroundColor
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
        
        if logoBackgroundView == nil {
            logoBackgroundView = UIView.init(frame: fromView.frame)
            logoBackgroundView.backgroundColor = startBackgroundColor
        }
        
        transitionContext.containerView()?.addSubview(logoBackgroundView)
        
        logoBackgroundView.radialAppireanceWithStartFrame(startFrame, duration: 0.5, complitBlock: { () -> Void in
            fromView.alpha = 0
            UIView.animateWithDuration(0.2, animations: {
                self.logoBackgroundView.alpha = 0
                }, completion: { (finished) in
                    transitionContext.completeTransition(true)
                    fromView.removeFromSuperview()
            })
            
        })
        
    }
    
}
