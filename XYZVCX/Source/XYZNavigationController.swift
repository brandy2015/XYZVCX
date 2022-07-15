//
//  XYZNavigationController.swift
//  XYZVCX
//
//  Created by 张子豪 on 2019/5/31.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
 
//属性

public extension UIViewController {
    
    func Navc的透明效果(titleColor:UIColor = .white,font:UIFont = UIFont(name: "Avenir Next", size: 25.0)!)  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor,NSAttributedString.Key.font:font]//        Heiti SC
        self.tabBarController?.tabBar.isHidden = true //不想要底边栏
    }
    
    
    func 配置NavigationController的透明效果()  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont(name: "Avenir Next", size: 40.0)!]
        self.tabBarController?.tabBar.isHidden = true //不想要底边栏
    }
}
