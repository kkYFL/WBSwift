//
//  WBTestViewController.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/21.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

class WBTestViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpUI() {
        super.setUpUI()
        
        //下一个
        //使用自定义nagationBar和navigationItem
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", fontSize: 16, target: self, action: #selector(nextPage))
    }
    
    func nextPage() {
        print("next!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
