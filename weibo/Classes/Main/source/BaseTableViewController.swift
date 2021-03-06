//
//  BaseTableViewController.swift
//  weibo
//
//  Created by 忧伤可乐 on 16/8/10.
//  Copyright © 2016年 李越. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController ,VisitorViewDelegate{
    //定义一个变量标记登录状态
    var userLogin = true
    //定义属性保存登录界面是否登录的状态
    var visitorView:VisitorView?
    /// 
    override func loadView() {
      userLogin ? super.loadView() :setupVisitorView()
    }
    
    fileprivate func setupVisitorView() {
        //1.初始化未登录界面
        let customView = VisitorView()
        customView.backgroundColor = UIColor.white
        customView.delegate = self
        view = customView
        visitorView = customView
        
        //2.设置导航条按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.registerBtnWillClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.loginBtnWillClick))
        
        
        
    }
    
    // MARK: - VisitorViewDelegate
    func loginBtnWillClick() {
        print(#function)
    }
    func registerBtnWillClick() {
        print(#function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
