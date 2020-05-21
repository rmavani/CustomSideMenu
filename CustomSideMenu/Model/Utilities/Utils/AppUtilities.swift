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
