//
//  AppDelegate.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/4.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.rootViewController = WZYTabBarController()
        
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

