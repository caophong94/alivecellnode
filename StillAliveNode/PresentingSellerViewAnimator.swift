    //
    //  PresentingSellerViewAnimator.swift
    //  StillAliveNode
    //
    //  Created by Dung Nguyen on 10/8/16.
    //  Copyright © 2016 Stay Hungry. All rights reserved.
    //
    
    import UIKit
    
    class PresentingSellerViewAnimator: NSObject, UIViewControllerAnimatedTransitioning {
        
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
            //let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!.view
            let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!.view
            toView.alpha = 0
            toView.frame = CGRectMake(0,
                                      0,
                                      CGRectGetWidth(transitionContext.containerView()!.bounds),
                                      CGRectGetHeight(transitionContext.containerView()!.bounds))
            
            if logoBackgroundView == nil {
                logoBackgroundView = UIView.init(frame: toView.frame)
                logoBackgroundView.backgroundColor = startBackgroundColor
            }
            
            transitionContext.containerView()?.addSubview(toView)
            transitionContext.containerView()?.addSubview(logoBackgroundView)
            
            logoBackgroundView.radialAppireanceWithStartFrame(startFrame, duration: 0.5, complitBlock: { () -> Void in
                toView.alpha = 1
                UIView.animateWithDuration(0.2, animations: {
                    self.logoBackgroundView.alpha = 0
                    
                    }, completion: { (finished) in
                        transitionContext.completeTransition(true)
                        
                })
                
            })
            
        }
        
    }
