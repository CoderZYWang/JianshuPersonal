//
//  WZYTitleView.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/9.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

protocol WZYTitleViewDelegate : class {
    func changeBottomScroll(titleBtnTag : Int)
}

class WZYTitleView: UIView {
    
    weak var delegate : WZYTitleViewDelegate?

    @IBOutlet weak var activityBtn: UIButton!
    @IBOutlet weak var articleBtn: UIButton!
    @IBOutlet weak var moreBtn: UIButton!
    
//    @IBOutlet weak var bottomLineView: UIView!
    
    private lazy var bottomLineView : UIView = {
        let bottomLineView : UIView = UIView(frame: CGRect(x: 297, y: 43, width: 30, height: 2))
        bottomLineView.backgroundColor = UIColor(red: 218 / 255.0, green: 130 / 255.0, blue: 119 / 255.0, alpha: 1)
        return bottomLineView
    }()
    
    
    private var lastSelBtn : UIButton?
    
    private var titleBtnArr : [UIButton]? = [UIButton]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleBtnArr?.append(activityBtn)
        titleBtnArr?.append(articleBtn)
        titleBtnArr?.append(moreBtn)
        
        lastSelBtn = moreBtn
        
        addSubview(bottomLineView)
    }
    
   
    
    class func titleView() -> WZYTitleView {
        
        
        return NSBundle.mainBundle().loadNibNamed("WZYTitleView", owner: nil, options: nil).first as! WZYTitleView
    }

}

// MARK: - 按钮点击
extension WZYTitleView {
    
    @IBAction func activityBtnClick(sender: UIButton) {
        
        if sender.tag == lastSelBtn?.tag {
            return
        }
        
        changeBtnSel(sender)
        
        delegate?.changeBottomScroll(sender.tag)
    }
    
    @IBAction func articleBtnClick(sender: UIButton) {
        
        if sender.tag == lastSelBtn?.tag {
            return
        }

        changeBtnSel(sender)
        
        delegate?.changeBottomScroll(sender.tag)
    }
    
    @IBAction func moreBtnClick(sender: UIButton) {
        
        if sender.tag == lastSelBtn?.tag {
            return
        }
        
        changeBtnSel(sender)
        
        delegate?.changeBottomScroll(sender.tag)
    }
    
    // 改变点击按钮状态函数
    private func changeBtnSel(clickBtn : UIButton) {
        
        lastSelBtn?.selected = false
        clickBtn.selected = true
        lastSelBtn = clickBtn

        UIView.animateWithDuration(0.25, delay: 0.25, options: .TransitionNone, animations: {
//            self.bottomLine.center.x = clickBtn.center.x
            print(clickBtn.center.x)
            self.bottomLineView.center.x = clickBtn.center.x
            
            }, completion: nil)
    }
}

// MARK: - KVO
extension WZYTitleView {
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
//        "keyPath-%@, object-%@, change-%@, context-%@", keyPath, object, change, context
//        print("keyPath-\(keyPath), object-\(object), change-\(change), context-\(context)")

        /*
        keyPath-Optional("contentOffset"),
        object-Optional(<UIScrollView: 0x7fc0dd07a800; frame = (0 269; 375 558); clipsToBounds = YES; gestureRecognizers = <NSArray: 0x7fc0db6c1380>; layer = <CALayer: 0x7fc0db6b97e0>; contentOffset: {375, 0}; contentSize: {1125, 0}>), 
        change-Optional(["new": NSPoint: {375, 0}, "kind": 1]), 
        context-0x0000000000000000
 */

        let scrollView : UIScrollView = object as! UIScrollView
        let num : Int = Int(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.width + 0.5)
//        print("num----\(num)")
        self.changeBtnSel(titleBtnArr![num])
    }
}
