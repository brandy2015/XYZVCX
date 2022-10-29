//
//  XYZOpenUIDocumentPickerVC.swift
//  XYZVCX
//
//  Created by zhangzihao on 2021/3/27.
//  Copyright © 2021 张子豪. All rights reserved.
//

import UIKit

//XYZVCX_Extension
//OpenUIDocPic

public enum XYZFileType {
    case Music,Picture,Video,PDF,ZIP,LMR,Office
}
public extension UIViewController{
    
    func OpenUIDocPic(fileType:XYZFileType,delegate:UIDocumentPickerDelegate){
        var documentTypes = [""]
        
        switch fileType {
        case .Music: print("Music格式")
            documentTypes = ["public.audio"]
        case .Picture:
            print("Picture格式")
            documentTypes = ["public.image"]
        case .Video:
            print("Video 格式")
            documentTypes = ["public.movie"]
        case .PDF:
            print("Music格式")
            documentTypes = ["com.adobe.pdf"]
        case .ZIP:
            print("ZIP 格式")
            documentTypes = ["com.pkware.zip-archive","org.gnu.gnu-zip-archive","org.gnu.gnu-zip-tar-archive","public.archive","public.zip-archive","com.rarlab.rar-archive","com.rarlab-rar-archive"]
        case .LMR:
            print("LMR 格式")
            documentTypes = ["com.pkware.zip-archive","org.gnu.gnu-zip-archive","org.gnu.gnu-zip-tar-archive","public.archive","public.zip-archive","com.rarlab.rar-archive","com.rarlab-rar-archive","public.item"]
//        default: print("未知格式")
            case .Office:
                print("LMR 格式")
                documentTypes = ["public.content","public.text","public.source-code","public.image","public.audiovisual-content","com.adobe.pdf","com.apple.keynote.key","com.microsoft.word.doc","com.microsoft.excel.xls","com.microsoft.powerpoint.ppt"]
        }
        
        
        let vc = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        vc.view.tintColor = .black
        vc.view.backgroundColor = .clear
        //这里判断是会员就可以多选
        vc.allowsMultipleSelection = true//是会员
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = delegate
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    func 系统文件夹导入文件(fileType:[String],delegate:UIDocumentPickerDelegate){
        let vc = UIDocumentPickerViewController(documentTypes: fileType, in: .import)
        vc.view.tintColor = .black
        vc.view.backgroundColor = .clear
        //这里判断是会员就可以多选
        vc.allowsMultipleSelection = true//是会员
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = delegate
        self.present(vc, animated: true, completion: nil)
    }
}

