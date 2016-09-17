//
//  WZYMoreController.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

private let moreTestId = "moreTestId"

class WZYMoreController: UITableViewController {
    
//    var scrollView1 : UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = UIColor(red: 83 / 255.0, green: 193 / 255.0, blue: 228 / 255.0, alpha: 1)
        
        tableView.bounces = false
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: moreTestId)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.tableView.scrollEnabled = false
        
//        self.tableView.userInteractionEnabled = false
//          print(self.tableView.contentSize)
    }
    
}

extension WZYMoreController {
    
//    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        
//        if scrollView1?.contentOffset.y <= 160 {
//            scrollView.scrollEnabled = false
//            //            scrollView.contentOffset = CGPointZero
//        } else {
//             scrollView.scrollEnabled = true
//        }
//    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("--------numberOfRowsInSection-----");
        return 40
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("\(indexPath.row)")
        let cell = tableView.dequeueReusableCellWithIdentifier(moreTestId, forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 83 / 255.0, green: 193 / 255.0, blue: 228 / 255.0, alpha: 1)
        cell.textLabel?.text = "更多 列表 --- \(indexPath.row)"
        return cell
    }
}
