//
//  WBNavigationController.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/20.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //隐藏navgationBar 
        navigationBar.isHidden = true
        
    }
    
    //重写push方法，所有的push方法都会调用此方法！此处可以拦截所有的push  VC
    //故此处可以用来隐藏tabBar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈底控制器，不需要处理
        if childViewControllers.count > 0 {
            //隐藏底部的TabBar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
