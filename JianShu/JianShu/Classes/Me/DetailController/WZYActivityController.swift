//
//  WZYActivityController.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

private let activityTestId = "activityTestId"

class WZYActivityController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.backgroundColor = UIColor(red: 100 / 255.0, green: 170 / 255.0, blue: 170 / 255.0, alpha: 1)
        
        tableView.bounces = false
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: activityTestId)
    }

}

extension WZYActivityController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(activityTestId, forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 100 / 255.0, green: 170 / 255.0, blue: 170 / 255.0, alpha: 1)
        cell.textLabel?.text = "动态 列表 --- \(indexPath.row)"
        return cell
    }
}
