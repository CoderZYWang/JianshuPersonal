//
//  WZYDetailRightTopViewButton.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/10.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYDetailRightTopViewButton: UIButton {

    override func awakeFromNib() {
        
        if imageView?.frame.origin.x < titleLabel?.frame.origin.x {
            
            titleLabel?.frame.origin.x = (imageView?.frame.origin.x)!
            imageView?.frame.origin.x = CGRectGetMaxX((titleLabel?.frame)!) + 5
        }
    }

}
