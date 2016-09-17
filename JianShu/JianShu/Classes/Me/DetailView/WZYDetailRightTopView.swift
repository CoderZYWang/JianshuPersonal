//
//  WZYDetailRightTopView.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/10.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYDetailRightTopView: UIView {

    class func detailRightTopView() -> WZYDetailRightTopView {
        
        return NSBundle.mainBundle().loadNibNamed("WZYDetailRightTopView", owner: nil, options: nil).first as! WZYDetailRightTopView
    }

}
