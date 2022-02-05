//
//  XYZPresent.swift
//  XYZManager
//
//  Created by 张子豪 on 2019/2/17.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit


class XYZPresent: NSObject {}


public func setRootVCTo(VCID:String,StoryboardName:String ,bundle:Bundle? = nil) {
    let Scene = UIApplication.shared.connectedScenes.filter { (XYZScene) -> Bool in
       return XYZScene.activationState == .foregroundActive
    }.first as? UIWindowScene
    let windowx = Scene?.windows.first
    windowx?.makeKey()
    
    guard let window = windowx ,window.isKeyWindow else {print("无window");return}
    window.rootViewController = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: VCID)
    window.makeKeyAndVisible()
}


public func FromDelegateSetRootVCTo(window:UIWindow?,VCID:String,StoryboardName:String ,bundle:Bundle? = nil) {
    window?.makeKey()
    guard let windowx = window ,windowx.isKeyWindow else {print("无window");return}
    windowx.rootViewController = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: VCID)
    windowx.makeKeyAndVisible()
}



extension NSObject{
    
    var XYZRootViewController :UIViewController?{
        let GetKeyWindow = UIApplication.shared.connectedScenes.compactMap { (SceneX) -> UIScene? in
            if SceneX.activationState == .foregroundActive{
                return SceneX
            }else{
                return nil
            }
        }
        guard let scenekEY = GetKeyWindow.first ,let KeyWindow = scenekEY as? UIWindowScene,let RootWindow = KeyWindow.windows.first ,let RootViewController = RootWindow.rootViewController else{return nil}
        return RootViewController
    }
    
}


public extension UIApplication {
    
    
    class var RootVC:UIViewController?{
        return getTopViewController()
    }

    class func getTopViewController(basex: UIViewController? = nil) -> UIViewController? {
        var base = basex
        if base == nil{
            base = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        }
        
        
        if let nav = base as? UINavigationController {
            return getTopViewController(basex: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(basex: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(basex: presented)
        }
        return base
    }
}



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

public extension UIViewController{
    
    func PresentNavcBack_vc<T:UIViewController>(With Classx:T,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve,completion: (() -> Void)? = nil ,BackVC:@escaping ((T) -> Void))  {
        guard let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: "\(Classx.classForCoder)") as? UINavigationController,let vcx = NAV.children.first as? T else{return};BackVC(vcx)
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
            
            let keyVC = UIView().XYZRootViewController
            
            keyVC?.PresentVC(With: id)
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
