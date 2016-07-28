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
        addChildViewController(childController:HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(childController: DiscoverTableViewController(), title: "首页", imageName: "tabbar_home")

        addChildViewController(childController:(),
                               title: "首页", imageName: "tabbar_home")
        addChildViewController(childController:HomeTableViewController(),
                               title: "首页", imageName: "tabbar_home")

    }

    
    private func addChildViewController(childController: UIViewController, title:String ,imageName:String)
    {
        childController.tabBarItem.image = UIImage(named:imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        childController.tabBarItem.selectedImage = UIImage(named:imageName + "_highlighted")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childController.title = title
        
        let nav = UINavigationController()
        nav.addChildViewController(childController)
        addChildViewController(nav)

    }

}
