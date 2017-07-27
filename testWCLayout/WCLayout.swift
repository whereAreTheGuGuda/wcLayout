//
//  WCLayout.swift
//  XinKeDaiSwift
//
//  Created by bia一下 on 2017/7/27.
//  Copyright © 2017年 bia一下. All rights reserved.
//
import UIKit

/// 各种屏幕尺寸的枚举
enum UIDevice_Screen {
    /// iPhone 非Retina
    case UIDevice_Screen_iPhone_NORetina
    /// iPhone 3.5寸 Retina  (320x480)
    case UIDevice_Screen_iPhone_Retina_3_5
    /// iPhone 4.0寸 Retina  (320x568)
    case UIDevice_Screen_iPhone_Retina_4
    /// iPhone 4.7寸 Retina  (375x667)
    case UIDevice_Screen_iPhone_Retina_4_7
    /// iPhone 5.5寸 Retina  (414x736)
    case UIDevice_Screen_iPhone_Retina_5_5
    /// iPad Retina
    case UIDevice_Screen_iPad_NORetina
    /// iPad Retina
    case UIDevice_Screen_iPad_Retina
}

var mSCreenWidth :(CGFloat) = UIScreen.main.bounds.size.width;
var mSCreenHeight :(CGFloat) = UIScreen.main.bounds.size.height;


// - 屏幕尺寸大小
var iPhone_Retina_3_5_W : (CGFloat) = 320.0;

var iPhone_Retina_3_5_H : (CGFloat) = 480.0;

let iPhone_Retina_4_W : (CGFloat) = 320.0;
let iPhone_Retina_4_H : (CGFloat) = 568.0;

let iPhone_Retina_4_7_W : (CGFloat) = 375.0;
let iPhone_Retina_4_7_H : (CGFloat) = 667.0;

let iPhone_Retina_5_5_W : (CGFloat) = 414.0;
let iPhone_Retina_5_5_H : (CGFloat) = 736.0;

var CGSizeiPhone_Retina_3_5 = CGSize(width: iPhone_Retina_3_5_W, height:iPhone_Retina_3_5_H);
var CGSizeiPhone_Retina_4 = CGSize(width: iPhone_Retina_4_W, height: iPhone_Retina_4_H);
var CGSizeiPhone_Retina_4_7 = CGSize(width: iPhone_Retina_4_7_W, height:iPhone_Retina_4_7_H);
var CGSizeiPhone_Retina_5_5 = CGSize(width: iPhone_Retina_5_5_W, height:iPhone_Retina_5_5_H);

// 自动转化 (倍值)
/// 使用 4_7D 直接输入 像素即可
/// 使用 5_5T 直接输入 像素即可
/// 都不需要除以 scale (缩放值)

func nvFont4_7D(value:(CGFloat)) -> CGFloat {
    return WCLayout.init().convertFontSizeFrom_4_7(number: value / 2.0);
}

func nvFont5_5T(value:(CGFloat)) -> CGFloat {
    return WCLayout.init().convertFontSizeFrom_5_5(number: value / 3.0);
}


func nvY4_7D(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertVFrom_4_7(number: value / 2.0);
}

func nvY5_5T(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertVFrom_5_5(number: value / 3.0);
}

func nvX4_7D(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertHFrom_4_7(number: value / 2.0);
}

func nvX5_5T(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertHFrom_5_5(number: value / 3.0);
}

func nvH4_7D(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertVFrom_4_7(number: value / 2.0);
}

func nvH5_5T(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertVFrom_5_5(number: value / 3.0);
}

func nvW4_7D(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertHFrom_4_7(number: value / 2.0);
}

func nvW5_5T(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertHFrom_5_5(number: value / 3.0);
}

/// 使用 带 X 的 输入的数值为视网膜屏的点 不能为像素值, 除以 scale 才为 点


func nvFont5_5X(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertFontSizeFrom_5_5(number: value);
}

func nvFont4_7X(value: CGFloat) -> CGFloat {
    return WCLayout.init().convertFontSizeFrom_4_7(number: value);
}

///// CGSizeMake

func CGSizeMake4_7X(widthV:(CGFloat), heightV:(CGFloat)) -> CGSize {
    return WCLayout.init().convertCGSizeMake4_7WithWidth(width: widthV, height: heightV);
}

func CGSizeMake5_5X(widthV: (CGFloat), heightV:(CGFloat)) -> CGSize {
    return WCLayout.init().convertCGSizeMake5_5WithWidth(width: widthV, height: heightV);
}

func CGSizeMake4_7D(width:(CGFloat), height:(CGFloat)) -> CGSize {
    return WCLayout.init().convertCGSizeMake4_7WithWidth(width: width, height: height);
}

func CGSizeMake5_5T(width:(CGFloat), height:(CGFloat)) -> CGSize {
    return WCLayout.init().convertCGSizeMake5_5WithWidth(width: width, height: height);
}


class WCLayout: NSObject {
    
    
    func CGSizeEqualToSize2(size1 : CGSize ,size2 : CGSize) -> Bool {
        return fabs(size1.width - size2.width) < 0.00001 &&  fabs(size1.height - size2.height) < 0.00001;
    }
    
    /// 判断当前屏幕是几寸屏幕
    func currentScreen() -> (UIDevice_Screen) {
        if UIScreen.main.scale == 1 {
            let result :CGSize = UIScreen.main.bounds.size;
            if CGSizeEqualToSize2(size1: result, size2: CGSizeiPhone_Retina_3_5) {
                return UIDevice_Screen.UIDevice_Screen_iPhone_Retina_3_5;
            }
            if CGSizeEqualToSize2(size1: result, size2: CGSizeiPhone_Retina_4) {
                return UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4;
            }
            if (CGSizeEqualToSize2(size1: result, size2: CGSizeiPhone_Retina_4_7)) {
                return UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4_7;
            }
            if (CGSizeEqualToSize2(size1: result, size2: CGSizeiPhone_Retina_5_5)) {
                return UIDevice_Screen.UIDevice_Screen_iPhone_Retina_5_5;
            }
            print("意料之外的屏幕尺寸!!!!")
            return UIDevice_Screen.UIDevice_Screen_iPhone_NORetina;
        }else{
            return UIDevice_Screen.UIDevice_Screen_iPhone_NORetina;
        }
    }
    func convertVFromWithBaseNumber(number:(CGFloat),baseNumber:(CGFloat)) -> CGFloat {
        let result = number;
        var scale :(CGFloat) = 1;
        switch self.currentScreen() {
        case UIDevice_Screen.UIDevice_Screen_iPhone_NORetina: break

        case UIDevice_Screen.UIDevice_Screen_iPad_Retina: break

        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_3_5:
            scale = iPhone_Retina_3_5_H / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_H / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_H / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_H / baseNumber;
            break;
        
        default: break
            
        }
        
        return result * scale;
    }
    
    /// 竖直方向
    func convertVFrom_4_7(number:(CGFloat)) -> CGFloat {
        return CGFloat(self.convertVFromWithBaseNumber(number: number, baseNumber: iPhone_Retina_4_7_H));
    }
    
    func convertVFrom_5_5(number:(CGFloat)) -> CGFloat {
        return CGFloat(self.convertVFromWithBaseNumber(number: number, baseNumber: iPhone_Retina_5_5_H));
    }
    
    func convertHFrom(number:(CGFloat),baseNumber:(CGFloat)) -> CGFloat {
        let result = number;
        var scale :(CGFloat) = 1;
        switch self.currentScreen() {
        case UIDevice_Screen.UIDevice_Screen_iPhone_NORetina: break
            
        case UIDevice_Screen.UIDevice_Screen_iPad_Retina: break
            
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_3_5:
            scale = iPhone_Retina_3_5_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_W / baseNumber;
            break;
            
        default: break
            
        }
        return result * scale;
    }
    
    //横向
    func convertHFrom_4_7(number:CGFloat) -> CGFloat {
        return CGFloat(self.convertHFrom(number: number, baseNumber: iPhone_Retina_4_7_H));
    }
    
    func convertHFrom_5_5(number:CGFloat) -> CGFloat {
        return CGFloat(self.convertHFrom(number: number, baseNumber: iPhone_Retina_5_5_H));
    }
    //字体
    func convertFontSizeFrom(number:(CGFloat),baseNumber:(CGFloat)) -> CGFloat {
        let result = number;
        var scale : (CGFloat) = 1;
        
        
        switch self.currentScreen() {
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_3_5:
            //3.5寸屏幕和4寸屏幕大小一样
            scale = iPhone_Retina_3_5_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4:
            scale = iPhone_Retina_4_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_4_7:
            scale = iPhone_Retina_4_7_W / baseNumber;
            break;
        case UIDevice_Screen.UIDevice_Screen_iPhone_Retina_5_5:
            scale = iPhone_Retina_5_5_W / baseNumber;
            break;
        default:
            break;
        }
        return result * scale;
    }
    
    /// 字体size 输入源(4.7寸)
    
    func convertFontSizeFrom_4_7(number: CGFloat) -> CGFloat {
        return self.convertHFrom(number: number, baseNumber: iPhone_Retina_4_7_W);
    }
        /// 字体size 输入源(5.5寸)
    
    func convertFontSizeFrom_5_5(number: CGFloat) -> CGFloat {
        return self.convertHFrom(number: number, baseNumber: iPhone_Retina_5_5_W);
    }

    func convertCGSizeMake4_7WithWidth(width:(CGFloat), height:(CGFloat)) -> CGSize {
        return CGSize(width: self.convertVFrom_4_7(number: width), height: self.convertHFrom_4_7(number: height));
    }
    
    func convertCGSizeMake5_5WithWidth(width:(CGFloat), height:(CGFloat)) -> CGSize {
        return CGSize(width: self.convertVFrom_5_5(number: width), height: self.convertHFrom_5_5(number: height));
    }
    
    func nvFont5_5T(value:Float) -> Float {
        
        return 0;
    }

}
