//
//  WZYDetailViewController.swift
//  JianShu
//
//  Created by 王中尧 on 16/9/8.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

class WZYDetailViewController: UIViewController {
//    
    let screenW : CGFloat = UIScreen.mainScreen().bounds.width
    
    // 自定义nav上面的titleView
    private var navTitleView : UIView!
    // nav 上面的 自定义titleView内的 imageView
    private var titleImageView : UIImageView!
    
    private var mainScroll : UIScrollView?
    
    // 三个顶部视图是完全是一样的
    private var topView : WZYDetailTopView?
    private var articleTopView : WZYDetailTopView?
    private var moreTopView : WZYDetailTopView?
    
    
    private var titleView : WZYTitleView?
    private var bottomScrollView : UIScrollView?
    
    
    private var lastPositionY : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加子控制器
        addChildControllers()
        // 搭建UI
        setupUI()
    }
    
    deinit {
        bottomScrollView?.removeObserver(titleView!, forKeyPath: "contentOffset")
    }

}

// MARK: - 添加子控制器
extension WZYDetailViewController {
    
    private func addChildControllers() {
        
        addChildViewController(WZYActivityController())
        addChildViewController(WZYArticleController())
        addChildViewController(WZYMoreController())
    }
}

// MARK: - 界面搭建
extension WZYDetailViewController {
    
    private func setupUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        // 设置导航条
        setupNav()
        // 设置主scrollView（上下滚动）
        setupMainScrollView()
        // 设置顶部个人简介视图
        setupTopView()
        // 设置中间titleView
        setupTitleView()
        // 设置底部横向滚动的scrollView
        setupBottomScrollView()
        // 添加子控制器的view到BottomScrollView中
        setupChildVcViewOnBottomScroll()
    }
    
    private func setupNav() {
        
        view.backgroundColor = UIColor.whiteColor()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithCustomView(imageNor: "icon_tabbar_share", imageHigh: nil, title: nil, target: nil, action: nil)
        
        // 自定义nav上面的titleView
        let navTitleView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        self.navTitleView = navTitleView
        navTitleView.backgroundColor = UIColor.clearColor()
        
        let titleImageView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        self.titleImageView = titleImageView
        titleImageView.backgroundColor = UIColor.whiteColor()
        titleImageView.layer.cornerRadius = titleImageView.bounds.size.width * 0.5
        titleImageView.layer.masksToBounds = true
        titleImageView.image = UIImage(named: "wzy")
        navTitleView.addSubview(titleImageView)
        navigationItem.titleView = navTitleView
    }
    
    private func setupMainScrollView() {
    
        // mainScroll 上下滚动
        let mainScroll : UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        // 注意mainScroll的contentSize的上下移动范围就只是在它的高度（屏幕高度）的基础上加了一个topView的高度
        mainScroll.contentSize = CGSize(width: 0, height: view.bounds.height + 160)
        mainScroll.showsVerticalScrollIndicator = false
        
        mainScroll.delegate = self
        mainScroll.tag = 12
        
        self.mainScroll = mainScroll
        self.view.addSubview(mainScroll)
    }
    
    private func setupTopView() {
        
        // 设置 动态 的topView
        let topView : WZYDetailTopView = WZYDetailTopView.detailTopView()
        topView.frame = CGRect(x: -view.bounds.width * 2, y: 64, width: view.bounds.width, height: 160)
//        topView.backgroundColor = UIColor.greenColor()
        self.topView = topView
        view.addSubview(topView)
        
        // 设置 文章 的topView
        let articleTopView : WZYDetailTopView = WZYDetailTopView.detailTopView()
        articleTopView.frame = CGRect(x: -view.bounds.width, y: 64, width: view.bounds.width, height: 160)
//        articleTopView.backgroundColor = UIColor.blueColor()
        self.articleTopView = articleTopView
        view.addSubview(articleTopView)
        
//        // 设置 更多 的topView
        let moreTopView : WZYDetailTopView = WZYDetailTopView.detailTopView()
//        moreTopView.backgroundColor = UIColor.redColor()
        moreTopView.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: 160)
        self.moreTopView = moreTopView
        view.addSubview(moreTopView)
    }
    
    private func setupTitleView() {
        
        let titleView : WZYTitleView = WZYTitleView.titleView()
        titleView.frame = CGRect(x: 0, y: CGRectGetMaxY(self.topView!.frame), width: view.bounds.width, height: 45)
        titleView.delegate = self
        self.titleView = titleView
        view?.addSubview(titleView) // 注意titleView是添加到当前控制器的view上的
    }
    
    private func setupBottomScrollView() {
        
        // 横向scrollView的frame应该是它的最大可见区域（width为屏幕宽度，height为屏幕宽度减去navBar的64，再减去titleView的height45）
        // 横向scrollView的y值在计算的时候不能依赖titleView，因为titleView是有粘滞效果的
        let bottomScrollView : UIScrollView = UIScrollView(frame: CGRect(x: 0, y: CGRectGetMaxY(topView!.frame) + 45, width: view.bounds.width, height: view.bounds.height - 64 - 45))
        bottomScrollView.contentSize = CGSize(width: view.bounds.width * 3, height: 0)
        bottomScrollView.pagingEnabled = true
        
        bottomScrollView.delegate = self
        bottomScrollView.tag = 11
        
        bottomScrollView.contentOffset = CGPoint(x: view.bounds.width * 2, y: 0)
        bottomScrollView.addObserver(titleView!, forKeyPath: "contentOffset", options: .New, context: nil)
//        bottomScrollView.backgroundColor = UIColor.orangeColor()
        self.bottomScrollView = bottomScrollView
        mainScroll!.addSubview(bottomScrollView)
    }
    
    private func setupChildVcViewOnBottomScroll() {
        
        for i in 0 ..< 3 {
            let childView : UIView = childViewControllers[i].view
           
            // 添加子控制器view的时候如果类型属于scrollView类型，那就先让他们无法滚动
            if childView.isKindOfClass(UIScrollView.self) {
                
                let childV : UIScrollView = childView as! UIScrollView
                childV.frame = CGRect(x: CGFloat(i) * bottomScrollView!.bounds.width, y: 0, width: bottomScrollView!.bounds.width, height: bottomScrollView!.bounds.height)
                childV.scrollEnabled = false
                bottomScrollView?.addSubview(childV)
            } else {
                
                childView.frame = CGRect(x: CGFloat(i) * bottomScrollView!.bounds.width, y: 0, width: bottomScrollView!.bounds.width, height: bottomScrollView!.bounds.height)
                bottomScrollView?.addSubview(childView)
            }
            
        }
    }
}


// MARK: - UIScrollViewDelegate
extension WZYDetailViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // 如果监听到的是mainScroll
        if scrollView.tag == 12 {
            
            let offsetY = scrollView.contentOffset.y
            
            // navTitleView头部缩放的效果
            if offsetY >= 0 && offsetY <= 30 {
                titleImageView?.transform = CGAffineTransformMakeScale(1 - (offsetY / 60), 1 - (offsetY / 60))
                titleImageView.frame.origin.y = 0
            } else if offsetY > 30 {
                titleImageView?.transform = CGAffineTransformMakeScale(0.5, 0.5)
                titleImageView.frame.origin.y = 0
            } else if offsetY < 0 {
                titleImageView?.transform = CGAffineTransformMakeScale(1, 1)
                titleImageView.frame.origin.y = 0
            }
            
//             scrollView.scrollEnabled = scrollView.contentOffset.y >= 161 ? false : true
            
            print("contentOffset---\(scrollView.contentOffset.y)")
            
            // topView跟随移动
            //        leftTopView?.frame.origin.y = (topView?.bounds.height)! + 64 - scrollView.contentOffset.y
            topView?.frame.origin.y = 64 - scrollView.contentOffset.y
            articleTopView?.frame.origin.y = 64 - scrollView.contentOffset.y
            moreTopView?.frame.origin.y = 64 - scrollView.contentOffset.y
            
            // titleView 顶部粘滞效果
            titleView?.frame.origin.y = (topView?.bounds.height)! + 64 - scrollView.contentOffset.y < 64 ? 64 : (topView?.bounds.height)! + 64 - scrollView.contentOffset.y
            
            // 在底部的mainScroll滚动过程中对childView 的 滚动性 实时改变(确实发生了改变，contentSize也有值，为什么就是contentSize好像没有了)
            
            for childView in (bottomScrollView?.subviews)! {
                if childView.isKindOfClass(UIScrollView.self) {
                    let childV : UITableView = childView as! UITableView
                    
                    
                    childV.scrollEnabled = scrollView.contentOffset.y > 160 ? true : false
                    
//                    childV.reloadData()
                    //                childV.contentSize = CGSize(width: 0, height: 2000)
                    // 检测当前的 下面两个属性  发现值是正确的  但是显示的效果就不对
                        print(childV.scrollEnabled)
                    
//                        print(childV.contentSize)
                }
            }
            
            print(bottomScrollView?.frame)
            
        }
        
        // 如果监听到的是bottomScrollView
        if scrollView.tag == 11 {
            let offsetX = scrollView.contentOffset.x
//            print(offsetX)
            if offsetX < -40 {
                navigationController?.popViewControllerAnimated(true)
            }
        }
    }
    
}

// MARK: - WZYTitleViewDelegate
extension WZYDetailViewController : WZYTitleViewDelegate {
    
    func changeBottomScroll(titleBtnTag: Int) {
        
        if titleBtnTag == 0 {
            
            self.articleTopView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag) + self.screenW
            self.moreTopView?.frame.origin.x = -2 * self.screenW * CGFloat(titleBtnTag) * CGFloat(titleBtnTag) + 5 * self.screenW * CGFloat(titleBtnTag) - 2 * self.screenW
        }
        
        if titleBtnTag == 1 {
            self.topView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag)
          
            self.moreTopView?.frame.origin.x = -2 * self.screenW * CGFloat(titleBtnTag) * CGFloat(titleBtnTag) + 5 * self.screenW * CGFloat(titleBtnTag) - 2 * self.screenW
        }
        
        if titleBtnTag == 2 {
            self.topView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag)
            self.articleTopView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag) + self.screenW
      
        }
        
        UIView.animateWithDuration(0.25, delay: 0, options: .TransitionNone, animations: {
            // 让mainScroll有一个上去的效果
            self.mainScroll?.contentOffset.y = 160
            }) { (true) in
                
                if titleBtnTag != 1 {
                    
                    UIView.animateWithDuration(0.1, animations: { 
                        // 让mainScroll有一个下来的效果(但是不需要动画)
                        self.mainScroll?.contentOffset.y = 0
                    })
                }
                
                UIView.animateWithDuration(0.25, delay: 0.25, options: .TransitionNone, animations: {
                    
                    self.bottomScrollView?.contentOffset = CGPoint(x: CGFloat(titleBtnTag) * (self.bottomScrollView?.bounds.width)!, y: 0)
                    
                    if titleBtnTag == 0 {
                        self.topView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag)
                    }
                    
                    if titleBtnTag == 1 {
                        self.articleTopView?.frame.origin.x = -self.screenW * CGFloat(titleBtnTag) + self.screenW
                    }
                    
                    if titleBtnTag == 2 {
                        self.moreTopView?.frame.origin.x = -2 * self.screenW * CGFloat(titleBtnTag) * CGFloat(titleBtnTag) + 5 * self.screenW * CGFloat(titleBtnTag) - 2 * self.screenW
                    }
                    
                    self.moreTopView?.frame.origin.x = -2 * self.screenW * CGFloat(titleBtnTag) * CGFloat(titleBtnTag) + 5 * self.screenW * CGFloat(titleBtnTag) - 2 * self.screenW
                    
                    }, completion: { (true) in
                        
                })
        }

    }
    
}
