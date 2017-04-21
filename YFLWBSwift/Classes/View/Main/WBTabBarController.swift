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
        
        setUpComposeButton()
    }
    
    //MARK：私有控件
    //撰写按钮
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    

    //MARK: - 监听方法
    func composeBtnStatus() {
      print("撰写微博")
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
            ["clsName":"WBHomeViewController","title":"首页","imageName":"home"],
            ["clsName":"WBMessageController","title":"消息","imageName":"message_center"],
            ["clsName":"UIViewController"],
            ["clsName":"WBDiscoverController","title":"发现","imageName":"discover"],
            ["clsName":"WBProfileController","title":"我","imageName":"profile"]
        ]
        
        var arrayM = [UIViewController]()
        for dic in array {
            arrayM.append(controller(dic: dic))
        }
        
        viewControllers = arrayM
        
    }
    
    
    //设置撰写按钮
    func setUpComposeButton() {
        tabBar.addSubview(composeButton)
        //设置按钮的位置
        let count = CGFloat(childViewControllers.count)
        //向内缩进宽度减少 能够让按钮的宽度变大 盖住容错点 防止穿帮
        let w = tabBar.bounds.width / count - 1
        //CGRectInSet   正数向内缩进 ，负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        //添加监听事件
        composeButton.addTarget(self, action: #selector(composeBtnStatus), for: .touchUpInside)
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
        
        //3.设置tabItem图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage (named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        
        //4.设置tabbar标题字体(一种方法)
        //字体颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .selected)
        //字体大小  注意：改变字体大小要在normal 模式下修改
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: UIControlState(rawValue: 0))
        
        //初始化导航控制器的时候 会调用push放法将rootViewController压入栈中
        let nav = WBNavigationController(rootViewController: vc)
        return nav
        
        
    }
}
