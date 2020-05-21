//
//  ViewController.swift
//  CustomSideMenu
//
//  Created by User on 21/05/20.
//  Copyright © 2020 Ravi Mavani. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    // MARK: - Initialize IBOutlets
    @IBOutlet var viewNav : UIView!
    @IBOutlet var viewMain : UIView!
    @IBOutlet var lblTitle : UILabel!
    
    // MARK: - Initialize Variables
    var strTitle : String = "Menu 1-1 Controller"
    
    // MARK: - Initialize 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.view.backgroundColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        viewNav.backgroundColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        
        lblTitle.text = strTitle
        
        // Add Swipe for Open Side Menu
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.rightSwipe(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.setDefault), userInfo: nil, repeats: false)
    }
    
    // MARK: - UIButton Click Events
    
    // MARK: - API Call
    
    // MARK: - Right Swipe
    @objc func rightSwipe(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                loadView(sender: self)
            case UISwipeGestureRecognizer.Direction.down: break
            case UISwipeGestureRecognizer.Direction.left: break
            case UISwipeGestureRecognizer.Direction.up: break
            default:
                break
            }
        }
    }
    
    // MARK: - Common Methods
    @objc func setDefault() {
        AppUtilities.sharedInstance.addshadowToView(top: false, left: false, bottom: true, right: false, shadowRadius: 3.0, viewMain: viewNav)
    }
    
    // MARK: - Other Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

