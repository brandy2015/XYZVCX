//
//  XYZPresent.swift
//  XYZManager
//
//  Created by 张子豪 on 2019/2/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit
//import Async


public extension UIViewController {
      func Dis()  {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func PresentVC(With id:String,StoryboardName:String = "Main") {
        
        let NAV =
            UIStoryboard(name: StoryboardName, bundle:nil).instantiateViewController(withIdentifier: id)
        DispatchQueue.main.async {
            self.present(NAV, animated: true, completion: nil)
        }
        
    }
//      func PresentVC(With id:String){//},On VC:UIViewController) {
//        let NAV =
//            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: id)
//
//        Async.userInitiated {}.main {
//            self.present(NAV, animated: true, completion: nil)
//        }
//    }
    
      func 配置NavigationController的透明效果()  {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont(name: "Avenir Next", size: 40.0)!]
        self.tabBarController?.tabBar.isHidden = true //不想要底边栏
    }
    
      func XPresent(VC:UIViewController,_ ID:String)  {
        let x = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: ID)//"MusicTVCID")//"MusicNavID")
        x.modalTransitionStyle = .crossDissolve
        VC.present(x, animated: true, completion: nil)
    }
    
      func PresentVCBack(With id:String,completion: (() -> Void)? = nil ,BackVC:@escaping ((UIViewController?) -> Void))  {
        
        
        let NAV =
            UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: id)
        BackVC(NAV)
        DispatchQueue.main.async {
            self.present(NAV, animated: true, completion: {
                if let completion = completion{
                    completion()
                }
            })
            
            
        }
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






//customizeAppearance()
//let tabController = window!.rootViewController as! UITabBarController
//if let tabViewControllers = tabController.viewControllers {
//    // First tab
//    var navController = tabViewControllers[0] as! UINavigationController
//    let controller1 = navController.viewControllers.first as! CurrentLocationViewController
//    controller1.managedObjectContext = managedObjectContext
//    // Second tab
//    navController = tabViewControllers[1] as! UINavigationController
//    let controller2 = navController.viewControllers.first as! LocationsViewController
//    controller2.managedObjectContext = managedObjectContext
//    let _ = controller2.view
//    // Third tab
//    navController = tabViewControllers[2] as! UINavigationController
//    let controller3 = navController.viewControllers.first as! MapViewController
//    controller3.managedObjectContext = managedObjectContext
//}
//print(applicationDocumentsDirectory)
//listenForFatalCoreDataNotifications()
