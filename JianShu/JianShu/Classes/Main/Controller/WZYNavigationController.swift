//
//  WZYNavigationController.swift
//  DayDayCook
//
//  Created by 王中尧 on 16/8/30.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYNavigationController: UINavigationController {

    private lazy var pan : UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector("handleNavigationTransition:"))
        return pan
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addPanGesture()
    }

}

// MARK: - 全屏滑动
extension WZYNavigationController : UIGestureRecognizerDelegate {
    
    private func addPanGesture() {
        // 禁用系统自带的屏幕边缘滑动手势
        interactivePopGestureRecognizer!.enabled = false;
        // 添加我们的自定义手势
        view.addGestureRecognizer(pan)
    }
    
    // 触发手势的时候，调用此方法，询问当前delegate是否触发该手势
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if childViewControllers.count > 1 {
            return true
        }
        
        return false
    }
}

// MARK: - 设置push过去的backBtn
extension WZYNavigationController {
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 { // nav的根控制器是不用设置的

            let backBtnItem = UIBarButtonItem.barButtonItemWithCustomView(imageNor: "icon_tabbar_back", imageHigh: nil, title: nil, target: self, action: #selector(WZYNavigationController.backBtnClick))
            
            viewController.navigationItem.leftBarButtonItem = backBtnItem
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func backBtnClick() {
        
        popViewControllerAnimated(true)
    }
}
