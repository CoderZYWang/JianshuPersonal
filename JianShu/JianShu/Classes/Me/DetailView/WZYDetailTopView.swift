//
//  WZYDetailTopView.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYDetailTopView: UIView {
    
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var infoBtn: UIButton!
    
    class func detailTopView() -> WZYDetailTopView {
        
        return NSBundle.mainBundle().loadNibNamed("WZYDetailTopView", owner: nil, options: nil).first as! WZYDetailTopView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.greenView.layer.cornerRadius = 5
        self.infoBtn.layer.cornerRadius = 5
    }

}
