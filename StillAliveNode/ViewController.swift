//
//  ViewController.swift
//  StillAliveNode
//
//  Created by Dung Nguyen on 10/8/16.
//  Copyright © 2016 Stay Hungry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var aliveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Action
    
    @IBAction func showAliveViewController(sender: UIButton) {
        let aliveVC = self.storyboard!.instantiateViewControllerWithIdentifier("AliveViewController")
        aliveVC.transitioningDelegate = self
        aliveVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(aliveVC, animated: true, completion: nil)
    }
    
    //MARK: - Animation Transition
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return PresentingSellerViewAnimator.init(startFrame: self.aliveButton.frame, startBackgroundColor: self.aliveButton.tintColor)
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return DismissingSellerViewAnimator.init(startFrame: self.aliveButton.frame, startBackgroundColor: self.aliveButton.tintColor)
    }
    

}

