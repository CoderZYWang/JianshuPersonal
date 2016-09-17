//
//  WZYMeSubCell.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/6.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYMeSubCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    private lazy var accessoryV : UIImageView = {
        let aView = UIImageView(image: UIImage(named: "icon_arrow_next"))
        aView.sizeToFit()
        return aView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        selectionStyle = .None
        accessoryView = accessoryV

    }
    
    class func meSubCell() -> WZYMeSubCell {
        
        return NSBundle.mainBundle().loadNibNamed("WZYMeSubCell", owner: nil, options: nil).first as! WZYMeSubCell
    }
}
