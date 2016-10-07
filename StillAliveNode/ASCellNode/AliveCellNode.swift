//
//  AliveCellNode.swift
//  StillAliveNode
//
//  Created by Dung Nguyen on 10/8/16.
//  Copyright © 2016 Stay Hungry. All rights reserved.
//

import AsyncDisplayKit

class AliveCellNode: ASCellNode {
    
    var aliveView : AliveView!
    var contentCellNode: ASDisplayNode!
    
    override init() {
        super.init()
        
        self.selectionStyle = .None
        
        contentCellNode = ASDisplayNode.init(viewBlock: { () -> UIView in
            self.aliveView = AliveView.instanceFromNib()
            return self.aliveView
        })
        
        self.addSubnode(contentCellNode)
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        contentCellNode.preferredFrameSize = CGSizeMake(constrainedSize.max.width, 70)
        
        let stackLayoutSpec = ASStackLayoutSpec.verticalStackLayoutSpec()
        stackLayoutSpec.setChild(contentCellNode)
        
        return stackLayoutSpec
    }
}
