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
        tabBar.tintColor = UIColor.yellow()
        let path = Bundle.main.pathForResource("MainSource.json", ofType: nil)
        if let jsonPath = path {
            let jsonData = NSData.init(contentsOfFile: jsonPath)
            do {
                //发生异常后会跳转到catch中处理
                let dicArr = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(dicArr)
                //遍历字典
                for dict in dicArr as! [[String:String]]
                {
                    addChildViewController(childController: dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
            }catch
            {
                print (error)
                addChildViewController(childController:"HomeTableViewController", title: "首页", imageName: "tabbar_home")
                addChildViewController(childController: "DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
                addChildViewController(childController:"NullViewController",
                                       title: "", imageName: "")
                addChildViewController(childController:"MessegeTableViewController",
                                       title: "消息", imageName: "tabbar_message_center")
                addChildViewController(childController: "ProfileTableViewController", title: "我的", imageName: "tabbar_profile")
            }
        }
        
    }
    
    
    private func addChildViewController(childController: String, title:String ,imageName:String)
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
    
    private lazy var composeBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "tabbar_compose_icon_heighlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage.init(named: "tabbar_compose_heighlighted"), for: UIControlState.highlighted)
        return btn
    }()
}
