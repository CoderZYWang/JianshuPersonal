//
//  UIImage+OriginalImage.swift
//  WZYBaisiSwift
//
//  Created by 王中尧 on 16/8/13.
//  Copyright © 2016年 wzy. All rights reserved.
//

import UIKit

extension UIImage {
    // 类方法
    class func imageWithOriginalName(imageName: String) -> UIImage? {
        
        var originalImage = UIImage(named: imageName)
        originalImage = originalImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        return originalImage
    }
}