//
//  XYZPresentHalf.swift
//  XYZVCX
//
//  Created by zhangzihao on 2022/8/10.
//  Copyright © 2022 张子豪. All rights reserved.
//
 
//import UIKit
//import SPStorkController
//
//class XYZPresentHalf: NSObject {
//
//}
//
//public extension UIViewController{
//
//    func HalfPresentVCX(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,customHeight:Int = 500) {
//
//        let modal = UIStoryboard(name: StoryboardName, bundle:nil).instantiateViewController(withIdentifier: id)
//        modal.navigationItem.leftBarButtonItem = nil
//        let transitionDelegate = SPStorkTransitioningDelegate()
////        transitionDelegate.storkDelegate = self
////        transitionDelegate.confirmDelegate = modal
//        transitionDelegate.customHeight = CGFloat(customHeight)
//        transitionDelegate.showIndicator = false
//        modal.transitioningDelegate = transitionDelegate
//        modal.modalPresentationStyle = .custom
//        self.present(modal, animated: true, completion: nil)
//    }
//}

