//
//  WZYMeViewController.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/4.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

private let meTopCellId = "meTopCellId"
private let meSubCellId = "meSubCellId"
private let meSectionLineCellId = "meSectionLineCellId"

class WZYMeViewController: UIViewController {
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        return tableView
    }()
    
    // 为什么不能数组里面包一个数组这样去懒加载呢？
//    private lazy var themeArr : [[String : String]] = {
//        let arr : [[String : String]] = [["公开文章", "123"], ["私密文章": "456"]]
//        return arr
//    }()
    
    private lazy var themeNameArr : [String] = {
        let arr : [String] = ["公开文章", "私密文章", "收藏的文章", "喜欢的文章", "我的专题", "我的文集", "夜间模式", "浏览历史", "通用设置", "分享简书APP", "意见反馈", "给简书评分"]
        return arr
    }()
    
    private lazy var themeIconArr : [String] = {
        let arr : [String] = ["icon_mine_article_public", "icon_mine_article_secret", "icon_mine_article_mark", "icon_mine_article_like", "icon_mine_topic_gray", "icon_mine_book_gray", "icon_mine_night", "icon_mine_history", "icon_settings", "icon_share_app", "icon_mine_feedback", "icon_mine_rate"]
        return arr
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cell间/section间  间距
        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
        
        self.tableView.separatorInset = UIEdgeInsetsZero;
        
        self.tableView.backgroundColor = UIColor(colorLiteralRed: 252.0 / 255, green: 252.0 / 255, blue: 252.0 / 255, alpha: 1)
        self.navigationItem.title = "我的"
        
        tableView.registerNib(UINib(nibName: "WZYMeTopCell", bundle: nil), forCellReuseIdentifier: meTopCellId)
    }
}

// MARK: - DataSource
extension WZYMeViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = WZYMeTopCell.meTopCell()
            cell.layoutMargins = UIEdgeInsetsZero;
            cell.selectionStyle = .None
            return cell
        } else if indexPath.row == 1 || indexPath.row == 8 {
            
            let cell = WZYMeClearCell.meClearCell()
            cell.layoutMargins = UIEdgeInsetsZero;
            cell.selectionStyle = .None
            return cell
        } else if indexPath.row < 8 {
            
            let cell = WZYMeSubCell.meSubCell()
            cell.textLabel?.font = UIFont.systemFontOfSize(15)
            cell.titleLabel.text = themeNameArr[indexPath.row - 2]
            cell.imageV?.image = UIImage(named: themeIconArr[indexPath.row - 2])
            cell.layoutMargins = UIEdgeInsetsMake(0, 20, 0, 0)
            
            if indexPath.row == 7 {
                cell.layoutMargins = UIEdgeInsetsZero // 该属性只对该行的下面一条分割线线有作用
            }
            cell.selectionStyle = .None
            return cell
        } else {
            
            let cell = WZYMeSubCell.meSubCell()
            cell.textLabel?.font = UIFont.systemFontOfSize(15)
            cell.titleLabel.text = themeNameArr[indexPath.row - 3]
            cell.imageV?.image = UIImage(named: themeIconArr[indexPath.row - 3])
            cell.layoutMargins = UIEdgeInsetsMake(0, 20, 0, 0)
            
            if indexPath.row == 7 {
                cell.layoutMargins = UIEdgeInsetsZero
            }
            cell.selectionStyle = .None
            return cell
        }
    }
}

extension WZYMeViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 90
        } else if indexPath.row == 1 || indexPath.row == 8 {
            return 20
        } else {
            return 44
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 0 {
            let detailVc = WZYDetailViewController()
            detailVc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVc, animated: true)
        }
    }
}

