//
//  WZYMeTopCell.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/5.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYMeTopCell: UITableViewCell {
    
    @IBOutlet weak var iconImageV: UIImageView!
    @IBOutlet weak var pinkBg: UIView!
    @IBOutlet weak var writeBg: UIView!
    
    private lazy var accessoryV : UIImageView = {
        let aView = UIImageView(image: UIImage(named: "icon_arrow_next"))
        aView.sizeToFit()
        return aView
    }()

    class func meTopCell() -> WZYMeTopCell {
        
        return NSBundle.mainBundle().loadNibNamed("WZYMeTopCell", owner: nil, options: nil).first as! WZYMeTopCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        selectionStyle = .None
        
        iconImageV.layer.cornerRadius = iconImageV.bounds.width * 0.5
        pinkBg.layer.cornerRadius = 6
        writeBg.layer.cornerRadius = 6
        
        iconImageV.layer.masksToBounds = true
        
        accessoryView = accessoryV
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
