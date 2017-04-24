//
//  WBBaseViewController.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/20.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    /*
     自定义导航条
     不能使用self
     */
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    //自定义导航项
    lazy var navItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
    }
    
    //重写 title 的 didSet方法
    override var title: String? {
        didSet{
            navItem.title = title
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK：- 设置界面
    func setUpUI() {
        self.view.backgroundColor = UIColor.cz_random()
        
        //添加导航条
        view.addSubview(navigationBar)
        //添加item 到bar
        navigationBar.items = [navItem]
        //设置 navBar 渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
    }
    
}


