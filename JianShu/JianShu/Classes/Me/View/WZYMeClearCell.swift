//
//  WZYMeClearCell.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYMeClearCell: UITableViewCell {

    class func meClearCell() -> WZYMeClearCell {
        
        return NSBundle.mainBundle().loadNibNamed("WZYMeClearCell", owner: nil, options: nil).first as! WZYMeClearCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
//        selectionStyle = .None
    }
    
}
