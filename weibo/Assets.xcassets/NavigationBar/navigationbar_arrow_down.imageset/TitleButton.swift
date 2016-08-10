//
//  TitleButton.swift
//  weibo
//
//  Created by 忧伤可乐 on 16/8/10.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        print("***")
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = self.bounds.width - (imageView?.frame.size.width)!
    }
  override  init(frame: CGRect) {
        super.init(frame: frame)
    setTitleColor(UIColor.darkGray, for: UIControlState.normal)
    setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), for: UIControlState.normal)
    setImage(#imageLiteral(resourceName: "navigationbar_arrow_up"), for:
        UIControlState.selected)
    sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
