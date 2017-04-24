//
//  WBHomeViewController.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/20.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //重写
    override func setUpUI() {
        super.setUpUI()
        
        //设置导航栏按钮,局限性系统的按钮没有高亮

        /*
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
         
         //Swift调用OC方法，返回instanceType，无法判断返回的类型
         let btn: UIButton = UIButton.cz_textButton("好友", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
         btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
         
         */
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriends))
  
    
    }
    
    //显示好友
    @objc private func showFriends() {
        print(#function)
        
        let vc = WBTestViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

