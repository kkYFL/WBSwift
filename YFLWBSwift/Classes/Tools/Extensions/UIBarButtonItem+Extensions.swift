//
//  UIBarButtonItem+Extensions.swift
//  YFLWBSwift
//
//  Created by 杨丰林 on 17/4/24.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /*
     
     paramter title:     标题
     paramter fontSize:  默认字体大小
     target:             目标对象
     action:             事件
     
     */
    
    convenience init(title:String, fontSize: CGFloat = 16,target: Any?, action: Selector) {
        
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        
        btn.addTarget(target, action: action, for: .touchUpInside)
       
        //self.init  实例化UIBarbttonItem
        self.init(customView: btn)
    }
    
}
