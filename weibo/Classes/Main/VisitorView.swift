//
//  VisitorView.swift
//  weibo
//
//  Created by 忧伤可乐 on 16/8/10.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    /// 设置未登录界面
    ///
    /// - parameter isHome:    <#isHome description#>
    /// - parameter imageName: <#imageName description#>
    /// - parameter message:   <#message description#>
    func setupVisotorInfo(isHome:Bool,imageName:String,message:String) -> () {
        //如果不是首页 将背景隐藏
        iconView.isHidden = !isHome
        //修改中间的图标
        homeIcon.image = UIImage.init(named: imageName)
        //修改文本
        messageLabel.text = message
        //判断是否要执行动画
        if isHome
        {
            startAnmation()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //1.添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        //2.布局子控件
        //2.1设置背景
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        //2.2 设置小房子
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        //2.3设置文本
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: iconView, size: nil)
        //什么控件的什么属性 等于 另外一个控件的什么属性 * 多少 + 多少
        addConstraint(NSLayoutConstraint.init(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 224))
        //2.4 设置按钮
        registerButton.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSize.init(width: 100, height: 30),offset:CGPoint.init(x: 0, y: 20))
        loginButton.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize.init(width: 100, height: 30),offset:CGPoint.init(x: 0, y: 20))
        //2.5 设置蒙版
        //        maskBGView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        maskBGView.xmg_Fill(referView: self)
    }
    
    //MARK: - 内部控制方法 首页动画
    private func startAnmation(){
        //1.创建动画
        let ani = CABasicAnimation.init(keyPath: "transform.rotation")
        //2.设置动画属性
        ani.toValue = 2*M_PI
        ani.duration = 20
        ani.repeatCount = MAXFLOAT
        
        //3.将动画添加到图层
        iconView.layer.add(ani, forKey: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //如果通过XIB 或者SB 创建该类 将会崩溃
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: - 懒加载控件
    ///背景图标
    private lazy var iconView: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    ///小房子图标
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    /// 描述文字
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.text = "hdghlfajkdfhafdjkldsahfdjkdsahfd"
        return label
    }()
    
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton ()
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControlState.normal)
        return btn
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton ()
        btn.setTitle("注册", for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "common_button_white_disable"), for: UIControlState.normal)
        return btn
    }()
    
    private lazy var maskBGView : UIImageView = {
        let iv = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
}
