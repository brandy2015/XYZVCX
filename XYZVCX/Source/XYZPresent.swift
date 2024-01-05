//
//  XYZPresent.swift
//  XYZVCX
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



public extension NSObject{
    
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
     
    
    @available(*, deprecated, message: "这个方法将在未来版本中被修改或移除，请谨慎使用。")
    func PresentVC(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve) {
        let NAV = UIStoryboard(name: StoryboardName, bundle:nil).instantiateViewController(withIdentifier: id)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {self.present(NAV, animated: true, completion: nil)}
    }
    
    @available(*, deprecated, message: "这个方法将在未来版本中被修改或移除，请谨慎使用。")
    func PresentWith(With VC:UIViewController,id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve) {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {VC.present(NAV, animated: true, completion: nil)}
    }
    
      func PresentVCBackNew(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve,completion: (() -> Void)? = nil ,BackVC:@escaping ((UIViewController?) -> Void))  {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id);BackVC(NAV)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {self.present(NAV, animated: true, completion: completion)}
    }
    
    func PresentVCBack(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve,completion: (() -> Void)? = nil ,BackVC:@escaping ((UIViewController?) -> Void))  {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id);
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {
            self.present(NAV, animated: true) {
                BackVC(NAV)
            }
            
        }
    }
    
    func BackVC(With id:String,StoryboardName:String = "Main",bundle:Bundle? = nil,PresentStyle:UIModalPresentationStyle = .fullScreen,TransitionStyle:UIModalTransitionStyle = .crossDissolve,completion: (() -> Void)? = nil ,BackVC:@escaping ((UIViewController?) -> Void))  {
        let NAV = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: id);BackVC(NAV)
        NAV.modalPresentationStyle = PresentStyle
        NAV.modalTransitionStyle = TransitionStyle
        DispatchQueue.main.async {
            self.present(NAV, animated: true) {
                
            }
            
        }
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
//
//public func PresentShareView(VC:UIViewController,URLs:[URL],on View:UIView){
//    let activityController = XYZShareActivityVC(URLs: URLs, on: View)
//    activityController.modalPresentationStyle = .fullScreen
//    VC.present(activityController, animated: true, completion: nil)
//}



public func setRootVCToXX(VCID:String,StoryboardName:String ,bundle:Bundle? = nil) {
    let Scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    let windowx = Scene?.windows.first
    windowx?.makeKey()
    windowx?.makeKeyAndVisible()
    guard let window = windowx ,window.isKeyWindow else {print("无window");return}
    window.rootViewController = UIStoryboard(name: StoryboardName, bundle:bundle).instantiateViewController(withIdentifier: VCID)
    window.makeKeyAndVisible()
}
 







import UIKit

public extension UIViewController {
    func PresentVCWithT<T: UIViewController>(StroryBoardName:String = "Main",With viewControllerClass: T.Type, PresentStyle: UIModalPresentationStyle = .fullScreen, TransitionStyle: UIModalTransitionStyle = .coverVertical, configuration: ((T) -> Void)? = nil) {
        // 创建视图控制器实例
        let viewController = UIStoryboard(name: StroryBoardName, bundle: self.nibBundle).instantiateViewController(withIdentifier: "\(viewControllerClass.self)") as! T
        
        // 调用配置闭包（如果有的话）
        configuration?(viewController)
        
        // 设置展示样式
        viewController.modalPresentationStyle = PresentStyle
        viewController.modalTransitionStyle = TransitionStyle
        
        // 展示视图控制器
        self.present(viewController, animated: true, completion: nil)
    }
}



import UIKit

public extension UIViewController {
    func PresentVCWithTNavi<T: UIViewController>(withID:String,StroryBoardName:String = "Main",With viewControllerClass: T.Type, PresentStyle: UIModalPresentationStyle = .fullScreen, TransitionStyle: UIModalTransitionStyle = .coverVertical, configuration: ((T) -> Void)? = nil) {
        // 创建视图控制器实例
        let viewController = UIStoryboard(name: StroryBoardName, bundle: self.nibBundle).instantiateViewController(withIdentifier: "\(withID.self)") as! UINavigationController
        
        // 调用配置闭包（如果有的话）
        configuration?(viewController.children.first as! T)
        
        // 设置展示样式
        viewController.modalPresentationStyle = PresentStyle
        viewController.modalTransitionStyle = TransitionStyle
        
        // 展示视图控制器
        self.present(viewController, animated: true, completion: nil)
    }
}
