//
//  PopoverPresentationController.swift
//  weibo
//
//  Created by 忧伤可乐 on 16/8/12.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit


class PopoverPresentationController: UIPresentationController {
    
    /// 初始化方法,用于创建负责专场动画的创建
    ///
    /// - parameter presentedViewController:  被展现的控制器
    /// - parameter presentingViewController: 发起的控制器
    ///
    /// - returns: 负责转场的动画
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        print(presentedViewController)
        print(presentingViewController)
        
    }
    
  override  func containerViewWillLayoutSubviews() {
    //修改弹出视图的大小
    //containerView 容器视图
    //presentedView 被展示的视图
    presentedView?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
    //在容器视图上添加蒙版,因为展现视图和蒙版都在一个视图
//    containerView?.addSubview(coverView)
    containerView?.insertSubview(coverView, at: 0)
    }
    fileprivate lazy var coverView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        //2.0 添加手势监听
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.close))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    func close(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
