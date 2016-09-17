//
//  UIBarButtonItem+BtnItem.swift
//  WZYBaisiSwift
//
//  Created by 王中尧 on 16/8/14.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func barButtonItemWithCustomView(imageNor imageNor: String, imageHigh: String?, title: String?, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .Custom)
        if title != nil {
            button.setTitle(title, forState: .Normal)
//            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
//            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        }

        button.setImage(UIImage(named: imageNor), forState: .Normal)
        
        if imageHigh != nil {
            button.setImage(UIImage(named: imageHigh!), forState: .Highlighted)
        }
        
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        let containView = UIView(frame: button.bounds)
        containView.addSubview(button)
        
        return UIBarButtonItem(customView: containView)
    }
    
    class func barButtonItemWithCustomView(imageNor imageNor: String, imageSel: String?, title: String?, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .Custom)
        if title != nil {
            button.setTitle(title!, forState: .Normal)
            //            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            //            button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        }
        
        button.setImage(UIImage(named: imageNor), forState: .Normal)
        
        if imageSel != nil {
            button.setImage(UIImage(named: imageSel!), forState: .Selected)
        }
        
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        let containView = UIView(frame: button.bounds)
        containView.addSubview(button)
        
        return UIBarButtonItem(customView: containView)
    }
}