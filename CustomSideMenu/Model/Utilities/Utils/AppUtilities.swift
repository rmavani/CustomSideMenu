//
//  AppUtilities.swift
//  CustomSideMenu
//
//  Created by User on 21/05/20.
//  Copyright © 2020 Ravi Mavani. All rights reserved.
//

import UIKit
import Foundation

class AppUtilities {

    class var sharedInstance :AppUtilities {
        struct Singleton {
            static let instance = AppUtilities()
        }
        return Singleton.instance
    }
    
    /*=======================================================
     Function Name: isNumberOnly
     Function Param : - String
     Function Return Type : - bool
     Function purpose :- check for enter text are numbers only
     ========================================================*/
    func isNumberOnly(strText : String) -> Bool {
        if strText == "" {
            return false
        }
        else {
            let numberRegEx = "^[0-9]*$"
            let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            let result = numberTest.evaluate(with: strText)
            return result
        }
    }
    
    /*=======================================================
     Function Name: isAlphabetOnly
     Function Param : - String
     Function Return Type : - bool
     Function purpose :- check for enter text are alphabet only
     ========================================================*/
    func isAlphabetOnly(strText : String) -> Bool {
        if strText == "" {
            return false
        }
        else {
            let numberRegEx = "^[A-Z]*$"
            let numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            let result = numberTest.evaluate(with: strText)
            return result
        }
    }
    
    /*=======================================================
     Function Name: isValidEmail
     Function Param : - String
     Function Return Type : - bool
     Function purpose :- check for valid Email ID
     ========================================================*/
    func isValidEmail(strEmail : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: strEmail)
        return result
    }
    
    /*=======================================================
     Function Name: isValidPhone
     Function Param : - String
     Function Return Type : - bool
     Function purpose :- check for valid phone Number
     ========================================================*/
    func isValidPhone(strPhoneNo : String) -> Bool {
        let PHONE_REGEX = "(?:(?:\\+|0{0,2})91(\\s*[\\- ]\\s*)?|[0 ]?)?[6789]\\d{9}|(\\d[ -]?) {10}\\d"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: strPhoneNo)
        return result
    }
    
    /*=======================================================
     Function Name: calculateTextHeight
     Function Param : - String, CGFloat, UIFont
     Function Return Type : - CGFloat
     Function purpose :- Check Text Height
     ========================================================*/
    func calculateTextHeight(inString : String, width : CGFloat, font : UIFont) -> CGFloat
    {
        let messageString = inString
        let attributes : [NSAttributedString.Key : Any]? = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : font]
        let attributedString : NSAttributedString = NSAttributedString(string: messageString, attributes: attributes)
        let rect : CGRect = attributedString.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        let requredSize:CGRect = rect
        return requredSize.height
    }
    
    /*=======================================================
    Function Name: addshadowToView
    Function Param : - Bool, Bool, Bool, Bool, CGFloat, UIView
    Function Return Type : - nil
    Function purpose :- To Add Shadow to View
    ========================================================*/
    func addshadowToView(top: Bool, left: Bool, bottom: Bool, right: Bool, shadowRadius: CGFloat = 2.0, viewMain : UIView) {
        
        viewMain.layer.masksToBounds = false
        viewMain.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewMain.layer.shadowRadius = shadowRadius
        viewMain.layer.shadowOpacity = 0.5
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = viewMain.frame.width
        var viewHeight = viewMain.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        path.close()
        viewMain.layer.shadowPath = path.cgPath
    }
}
