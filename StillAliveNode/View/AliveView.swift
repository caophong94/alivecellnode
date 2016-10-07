//
//  AliveView.swift
//  StillAliveNode
//
//  Created by Dung Nguyen on 10/8/16.
//  Copyright © 2016 Stay Hungry. All rights reserved.
//

import UIKit

class AliveView: UIView {

    class func instanceFromNib() -> AliveView {
        return UINib(nibName: "AliveView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! AliveView
    }

}
