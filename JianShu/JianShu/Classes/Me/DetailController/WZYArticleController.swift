//
//  WZYArticleController.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

private let articleTestId = "articleTestId"

class WZYArticleController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = UIColor(red: 235 / 255.0, green: 141 / 255.0, blue: 105 / 255.0, alpha: 1)
        
        tableView.bounces = false
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: articleTestId)
    }
    
}

extension WZYArticleController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(articleTestId, forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 235 / 255.0, green: 141 / 255.0, blue: 105 / 255.0, alpha: 1)
        cell.textLabel?.text = "文章 列表 --- \(indexPath.row)"
        return cell
    }
}