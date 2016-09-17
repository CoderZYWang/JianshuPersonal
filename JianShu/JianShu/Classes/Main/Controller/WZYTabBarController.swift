//
//  WZYTabBarController.swift
//  DayDayCook
//
//  Created by 王中尧 on 16/8/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYTabBarController: UITabBarController {

    static var instance: dispatch_once_t = 0
    override class func initialize() {
        dispatch_once(&instance) {
            
            // 设置标题
            var normalAttrs = Dictionary<String, AnyObject>()
            normalAttrs[NSFontAttributeName] = UIFont.systemFontOfSize(12)
            normalAttrs[NSForegroundColorAttributeName] = UIColor.lightGrayColor()
            
            var selectedAttrs = Dictionary<String, AnyObject>()
            selectedAttrs[NSForegroundColorAttributeName] = UIColor.orangeColor()
            
//            let tabBarItem = UITabBarItem.appearanceWhenContainedInInstancesOfClasses([self.classForCoder()]);
            let tabBarItem = UITabBarItem.appearanceWhenContainedInInstancesOfClasses([WZYTabBarController.self])
            tabBarItem.setTitleTextAttributes(normalAttrs, forState: UIControlState.Normal)
            tabBarItem.setTitleTextAttributes(selectedAttrs, forState: UIControlState.Selected)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = UIColor.whiteColor()

        // MARK: - 初始化子控制器
        setupChildControllers()
        
        // MARK: - 添加writeBtn
        setupWriteBtn()
    }
    
}

extension WZYTabBarController {
    
    // MARK: - 添加writeBtn
    private func setupWriteBtn() {
        
        let writeBtn = UIButton(type: .Custom)
        writeBtn.setImage(UIImage(named: "button_write"), forState: .Normal)
//        writeBtn.setImage(UIImage(named: "button_write"), forState: .Highlighted)
        writeBtn.addTarget(self, action: #selector(WZYTabBarController.writeBtnClick), forControlEvents: .TouchUpInside)
        writeBtn.sizeToFit()
        writeBtn.center = CGPointMake(tabBar.frame.width * 0.5, tabBar.frame.height * 0.5)
        tabBar.addSubview(writeBtn)
        
    }
    
    @objc private func writeBtnClick() {
        
        print("123")
    }
    
    // MARK: - 初始化子控制器
    private func setupChildControllers() {
        setupChildControllers(WZYHomeViewController(), normalImageStr: "icon_tabbar_home", selectedImageStr: "icon_tabbar_home_active", title: "发现")
        
        setupChildControllers(WZYSubViewController(), normalImageStr: "icon_tabbar_me", selectedImageStr: "icon_tabbar_me_active", title: "关注")
        
        let vc = UIViewController()
        vc.tabBarItem.enabled = false
        addChildViewController(vc)
        
        setupChildControllers(WZYNotiViewController(), normalImageStr: "icon_tabbar_notification", selectedImageStr: "icon_tabbar_notification_active", title: "消息")
        
        setupChildControllers(WZYMeViewController(), normalImageStr: "icon_tabbar_subscription", selectedImageStr: "icon_tabbar_subscription_active", title: "我的")
    }
    
    // MARK: - 设置tabBarItem
    private func setupChildControllers(viewController : UIViewController, normalImageStr : String, selectedImageStr : String, title : String) {
        let nav = WZYNavigationController(rootViewController:viewController)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: normalImageStr)
        nav.tabBarItem.selectedImage = UIImage.imageWithOriginalName(selectedImageStr)
        addChildViewController(nav)
        
    }
    
}
