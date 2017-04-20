//
//  WBTabBarController.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/20.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

class WBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChildViewControllers()
    }

}

/*
 extension  类似于OC中的分类，在Swift中还可以用来切分代码块
 可以把相似功能的函数，放在一个 extension 中
 便于代码维护
 注意：和OC的分类一样， extension 中不能定义属性
 */
//MARK: 设置界面

extension WBTabBarController{
    //设置所有的子控件
     func setUpChildViewControllers(){
        
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":""]
        ]
        
        var arrayM = [UIViewController]()
        for dic in array {
            arrayM.append(controller(dic: dic))
        }
        
        viewControllers = arrayM
        
    }
    
    /*
     使用一个字典创建一个子控制器
     dic [clsNamt,title,imageName]
     return  子控制器
     */
    private func controller(dic:[String:String]) -> UIViewController {
        //1.获取字典内容
        guard let clsName = dic["clsName"], let title = dic["title"], let imageName = dic["imageName"], let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else {
            return UIViewController()
        }
        
        //2.创建视图控制器
        let vc = cls.init()
        vc.title = title
        let nav = WBNavigationController(rootViewController: vc)
        return nav
        
        
    }
}
