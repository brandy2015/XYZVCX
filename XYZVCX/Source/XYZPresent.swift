//
//  XYZPresent.swift
//  XYZManager
//
//  Created by 张子豪 on 2019/2/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
import Async


public extension UIViewController {
    public func Dis()  {
        dismiss(animated: true, completion: nil)
    }
    
    public func PresentVC(With id:String){//},On VC:UIViewController) {
        let NAV =
            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: id)
        
        Async.userInitiated {}.main {
            self.present(NAV, animated: true, completion: nil)
        }
    }
    
    func 配置NavigationController的透明效果()  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont(name: "Avenir Next", size: 40.0)!]
        self.tabBarController?.tabBar.isHidden = true //不想要底边栏
    }
    
    public func XPresent(VC:UIViewController,_ ID:String)  {
        let x = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: ID)//"MusicTVCID")//"MusicNavID")
        x.modalTransitionStyle = .crossDissolve
        VC.present(x, animated: true, completion: nil)
    }
    
    
    
}


public func XYZKeyPresent(With id:String) {
    let NAV =
        UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: id)
    
    for i in UIApplication.shared.windows{
        if i.isKeyWindow{
            print("是正在显示的")
            i.rootViewController?.presentedViewController?.present(NAV, animated: true, completion: nil)
        }else{print("不是正在显示的")
            
            if let KeywindowsX = UIApplication.shared.keyWindow,let KeyVC = KeywindowsX.rootViewController{
                print("在这里")
                KeyVC.PresentVC(With: id)//, On: KeyVC)
            }
            
            
        }
    }
}
//public class XYZPresent: NSObject {
//
//}

//extension NSObject {
//
//    public func VC(id:String?,StoryBoardName:String = "Main")  -> UIViewController? {
//        if let id = id{
//            return  UIStoryboard(name: StoryBoardName, bundle:nil).instantiateViewController(withIdentifier: id)
//        }else{return nil}
//    }
//    public func UIVC(id:String?,StoryBoardName:String = "Main") -> UIViewController? {
//        if let id = id{
//            return  UIStoryboard(name: StoryBoardName, bundle:nil).instantiateViewController(withIdentifier: id)
//        }else{ return nil}
//    }
//    public func PresentNAV(with VC:UIViewController,id:String?,StoryBoardName:String = "Main") {
//        if let id = id{
//            let NAV =  UIStoryboard(name: StoryBoardName, bundle:nil).instantiateViewController(withIdentifier: id)
//            VC.present(NAV, animated: true, completion: nil)
//        }
//    }
//}

//public extension UIViewController {
//
//    public func PresentNAV(id:String?,StoryBoardName:String = "Main") {
//
//        if let id = id{
//            let NAV =  UIStoryboard(name: StoryBoardName, bundle:nil).instantiateViewController(withIdentifier: id)
//            self.present(NAV, animated: true, completion: nil)
//        }
//    }
//
//}




//            let window = UIApplication.shared.keyWindow
//
//            window?.rootViewController = x
//            window?.makeKeyAndVisible()
//x.modalTransitionStyle = .crossDissolve
