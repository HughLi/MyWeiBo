//
//  MainViewController.swift
//  weibo
//
//  Created by 李越 on 2016/7/24.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBar.tintColor = UIColor.init(red: 255/255.0, green: 118/255.0, blue: 1/255.0, alpha: 1)
        //设置外观
        
        //添加子控制器
        addChildViewControllers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeBtn()
    }
    fileprivate func setupComposeBtn()//添加Btn
    {
        tabBar.addSubview(composeBtn)
        let width = UIScreen.main.bounds.size.width/CGFloat(viewControllers!.count)
        let rect = CGRect.init(x: 0, y: 0, width: width, height: 49)
        composeBtn.frame = rect.offsetBy(dx: 2*width, dy: 0)
        
    }
    
    //设置子控制器
    
    fileprivate func addChildViewControllers (){
        let path = Bundle.main.path(forResource: "MainSource.json", ofType: nil)
        if let jsonPath = path {
            let jsonData = NSData.init(contentsOfFile: jsonPath)
            do {
                //发生异常后会跳转到catch中处理
                let dicArr = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                print(dicArr)
                //遍历字典
                for dict in dicArr as! [[String:String]]
                {
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
            }catch
            {
                print (error)
                addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
                addChildViewController("DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
                //占位控制器
                addChildViewController("NullViewController",
                                       title: "", imageName: "")
                addChildViewController("MessegeTableViewController",
                                       title: "消息", imageName: "tabbar_message_center")
                addChildViewController("ProfileTableViewController", title: "我的", imageName: "tabbar_profile")
            }
        }
        
    }
    
    
    fileprivate func addChildViewController(_ childController: String, title:String ,imageName:String)
    {
        print (childController)
        let vc = (NSClassFromString(Bundle.main.infoDictionary?["CFBundleExecutable"]as! String + "." + childController) as!UIViewController.Type).init()
        print(vc)
        vc.tabBarItem.image = UIImage(named:imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named:imageName + "_highlighted")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.title = title
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }
    func composeBtnClick() {
        print("hahh" )
        
    }
    
    fileprivate lazy var composeBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action:#selector(MainViewController.composeBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
}
