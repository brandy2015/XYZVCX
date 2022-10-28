//
//  XYZShareVC.swift
//  XYZVCX
//
//  Created by zhangzihao on 2022/8/11.
//  Copyright © 2022 张子豪. All rights reserved.
//

import UIKit

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

public extension UIViewController{
    func PresentShareView(Images:[UIImage]){
        let activityController = XYZShareActivityVC(Images: Images, on: self.view)
        activityController.modalPresentationStyle = .fullScreen
        self.present(activityController, animated: true, completion: nil)
    }
}


//分享图片
public func XYZShareActivityVC(Images:[UIImage],on View:UIView) -> UIActivityViewController{
    let activityController = UIActivityViewController(activityItems: Images, applicationActivities: nil)
    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail, UIActivity.ActivityType.print, UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
    activityController.excludedActivityTypes = excludedActivities
    activityController.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
    activityController.popoverPresentationController?.sourceView = View
    return activityController
}
