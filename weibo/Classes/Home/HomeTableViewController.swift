//
//  HomeTableViewController.swift
//  weibo
//
//  Created by 李越 on 2016/7/24.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //如果没有登录 设置未登录的界面
        if !userLogin
        {
            visitorView?.setupVisotorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
        setupNav()
    }
    private func setupNav()
    {
        //1.创建左边按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(HomeTableViewController.leftItemClick))
        //2.创建右边按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(HomeTableViewController.rightItemClick))
        
        //3.初始化标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("忧伤可乐 ", for: UIControlState.normal)
        titleBtn.addTarget(self, action: #selector(HomeTableViewController.titleBtnClick(btn:)), for: UIControlEvents.touchUpInside)
        navigationItem.titleView = titleBtn
    }
    func titleBtnClick(btn : TitleButton) -> () {
        btn.isSelected = !btn.isSelected
        
    }
    ///左边按钮执行方法
    func rightItemClick()
    {
        print(#function)
    }
    ///右边按钮执行方法
    func leftItemClick()
    {
        print(#function)
    }
    
    
}
