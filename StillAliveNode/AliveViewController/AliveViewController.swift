//
//  AliveViewController.swift
//  StillAliveNode
//
//  Created by Dung Nguyen on 10/8/16.
//  Copyright © 2016 Stay Hungry. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class AliveViewController: UIViewController, ASTableDataSource, ASTableDelegate {
    
    var tableNode = ASTableNode()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Helper
    
    private func setupUI() {
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        tableNode.view.separatorStyle = UITableViewCellSeparatorStyle.None
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.frame = CGRectMake(0, 52, screenWidth, screenHeight - 52)
        
        self.view.addSubnode(tableNode)
    }
    
    //MARK: - Action
    
    @IBAction func dismiss(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: - ASTableNode Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func tableView(tableView: ASTableView, nodeBlockForRowAtIndexPath indexPath: NSIndexPath) -> ASCellNodeBlock {
        
        let cellBlock = { () -> ASCellNode in
            
            let cellNode = AliveCellNode()
            return cellNode
        }
        return cellBlock
    }


}
