//
//  XYZPresent.swift
//  XYZManager
//
//  Created by 张子豪 on 2019/2/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit


class XYZPresent: NSObject {}

public extension UIViewController {
    func Dis()  {  DispatchQueue.main.async {self.dismiss(animated: true, completion: nil)}}
    
    func PresentVC(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve) {
        let NAV = UIStoryboard(name: StoryboardName, bundle:nil).instantiateViewController(withIdentifier: id)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {self.present(NAV, animated: true, completion: nil)}
    }
    
    func PresentWith(With VC:UIViewController,id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve) {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {VC.present(NAV, animated: true, completion: nil)}
    }
    
      func PresentVCBack(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve,completion: (() -> Void)? = nil ,BackVC:@escaping ((UIViewController?) -> Void))  {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id);BackVC(NAV)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {self.present(NAV, animated: true, completion: completion)}
    }
    
}


public func XYZKeyPresent(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve) {
    let NAV =  UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id)
    NAV.modalPresentationStyle = PresentStyle
    NAV.modalTransitionStyle = TransitionStyle
    
    for i in UIApplication.shared.windows{
        if i.isKeyWindow{
            print("是正在显示的")
            i.rootViewController?.presentedViewController?.present(NAV, animated: true, completion: nil)
        }else{print("不是正在显示的")
            if let KeywindowsX = UIApplication.shared.keyWindow,let KeyVC = KeywindowsX.rootViewController{
                print("在这里")
                KeyVC.PresentVC(With: id)
            }
    }}
}



public func PresentShareView(VC:UIViewController,URLs:[URL],on View:UIView){
    let activityController = XYZShareActivityVC(URLs: URLs, on: View)
    activityController.modalPresentationStyle = .fullScreen
    VC.present(activityController, animated: true, completion: nil)
}

public extension UIViewController{
    func PresentShareView(URLs:[URL]){
        let activityController = XYZShareActivityVC(URLs: URLs, on: self.view)
        activityController.modalPresentationStyle = .fullScreen
        self.present(activityController, animated: true, completion: nil)
    }
}

public func XYZShareActivityVC(URLs:[URL],on View:UIView) -> UIActivityViewController{
    //    let fileURL = 文件地址
    let activityController = UIActivityViewController(activityItems: URLs, applicationActivities: nil)
    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = View
    return activityController
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
