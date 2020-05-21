//
//  UIColor+Extension.swift
//  CustomSideMenu
//
//  Created by User on 21/05/20.
//  Copyright © 2020 Ravi Mavani. All rights reserved.
//

import Foundation
import UIKit

let ColorPrimary = "#0288D1"
let ColorRed = "#FF3B30"

extension UIColor {
    
    private class func rgb(fromHex: String, alpha:CGFloat) -> UIColor {
        
        var cString:String = fromHex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: alpha)
    }
    
    class func connectColor(name:String,alpha:CGFloat)->UIColor{
         return rgb(fromHex: name, alpha: alpha)
    }
}

