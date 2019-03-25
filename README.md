[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/cywd/FitRefresh/blob/master/LICENSE) 
[![CocoaPods](http://img.shields.io/cocoapods/v/SoHow.svg?style=flat)](http://cocoapods.org/?q=SoHow)




# SoHow
Easy way in Swift
各种各样的方法



## Requirements
* Xcode 10 or higher
* iOS 10.1 or higher (may work on previous versions, just did not test it)
* ARC
* Swift 4.2

## Demo



## Installation

### CocoaPods

``` ruby
pod 'SoHow'
```

### Manual

Add SoHow folder into your project.

## Example usage
Import SoHow

1、 将照片添加毛玻璃处理

要处理的图片直接后缀加.applyDarkEffect()

要处理的图片直接后缀加.applyLightEffect()

UIImage().applyDarkEffect()

UIImage().applyLightEffect()


 2、颜色(red: CGFloat, green: CGFloat, blue: CGFloat)
 
   颜色(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
   
 3、时间格式的调整(date: Date)//默认是"yyyy年MM月dd日 HH:mm:ss"
       时间格式的调整(date: Date, format: String)
       
 4、返回设备类型()   //返回值是String，设备类型
 
 5、返回设备信息()   //返回String分别为(设备类型:String,设备名称:String,系统版本号:String,设备唯一标识符:String,设备的大类型:String,App的版本号:String,App的build版本:String,App的build版本:String,appName:[String])
 
 6、压缩照片（默认压缩比为0.5）
 
      y压缩imageCompress(originalImage: UIImage)
      
      y压缩imageCompress(originalImage: UIImage, 压缩比: CGFloat)
      
 7、弹出分享界面//返回值为UIActivityViewController需要用present(activityController, animated: true, completion: nil)
      share分享功能(文件地址: String)
      
8、处理头像圆角

      处理头像圆角(处理的ImageView: ImageView)//默认为处理成圆形
      
      处理头像圆角(处理的ImageView: ImageView, 圆角大小: CGFloat)
 
 9、使用系统库发音
 
      f发音内容(内容: String)
      
 10、打开网页(网路WebView: UIWebView, 地址: String)
 
 
 11、延迟调用
 
       afterDelay(seconds:Double) {}
        
       延迟调用（seconds:Double）{}
    
