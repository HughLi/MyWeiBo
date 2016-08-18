//
//  UIbarButtonItem+category.swift
//  weibo
//
//  Created by 忧伤可乐 on 16/8/10.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit
extension UIBarButtonItem
{
 //在function 前面添加Class 就如同OC中的+方法
    class func creatBarButtonItem(_ imageName:String , target:AnyObject?,action:Selector) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem.init(customView: btn)
    }
}
