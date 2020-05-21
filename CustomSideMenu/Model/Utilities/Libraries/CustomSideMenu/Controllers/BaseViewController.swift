//
//  BaseViewController.swift
//  CustomSideMenu
//
//  Created by User on 21/05/20.
//  Copyright © 2020 Ravi Mavani. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Initialize IBOutlets
    var menuView : SideMenu!
    
    // MARK: - Initialize Variables
    var isMenuView : Bool = false
    
    // MARK: - Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Side Menu View
        self.menuView = SideMenu(nibName: "SideMenu", bundle: nil)
        self.menuView.view.backgroundColor = UIColor.clear
        menuView.delegate = self
        menuView.view.frame = CGRect(x : -self.view.frame.width, y : 0, width : self.view.frame.width, height : self.view.frame.height )
       
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(BaseViewController.respondToSwipeGesture1(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.menuView.view.addGestureRecognizer(swipeLeft)
    }
    @objc func respondToSwipeGesture1(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                break
            case UISwipeGestureRecognizer.Direction.down: break
            case UISwipeGestureRecognizer.Direction.left:
                self.SwipeHideView(sender: nil)
            case UISwipeGestureRecognizer.Direction.up: break
            default:
                break
            }
        }
    }
    
    // MARK: - UIButton Click Events
    @IBAction func loadView(sender : AnyObject!) {
        self.view.endEditing(true)
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                self.isMenuView = false
                self.menuView.view.frame = CGRect(x : -self.view.frame.width, y : 0,width : self.view.frame.width, height :self.view.frame.height )
            }) { (finished) in
                self.menuView.view.removeFromSuperview()
            }
        }
        else {
            UIView.animate(withDuration: 0.3, animations: {
                self.isMenuView = true
                self.menuView.view.frame = CGRect(x : 0, y : 0,width : self.view.frame.width, height : self.view.frame.height  )
                self.view.addSubview(self.menuView.view)
            }) { (finished) in
            }
        }
    }
    @IBAction func SwipeHideView(sender : AnyObject!) {
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                self.isMenuView = false
                self.menuView.view.frame = CGRect(x : -self.view.frame.width, y : 0,width : self.view.frame.width, height :self.view.frame.height )
            }) { (finished) in
                self.menuView.view.removeFromSuperview()
            }
        }
    }
}

// MARK: - DetailViewController Delegate Methods
extension BaseViewController: DetailViewControllerDelegate {
    
    func didSelectButton(sender : UIButton, strType : String) {
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                self.isMenuView = false
                self.menuView.view.frame = CGRect(x : -self.view.frame.width, y : 0, width : self.view.frame.width,height : self.view.frame.height )
            }) { (finished) in
            }
        }
    }
    
    func didFinishTask(sender: SideMenu, index : IndexPath) {
        if isMenuView {
            UIView.animate(withDuration: 0.3, animations: {
                self.isMenuView = false
                self.menuView.view.frame = CGRect(x : -self.view.frame.width, y : 0, width : self.view.frame.width,height : self.view.frame.height )
            }) { (finished) in
                self.menuView.view.removeFromSuperview()
                if index.section == 0 {
                    if index.row == 0 {
                        // Menu 1-1
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 1-1 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                    else if index.row == 1 {
                        // Menu 2-1
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 2-1 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                    else if index.row == 2 {
                        // Menu 3-1
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 3-1 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                }
                else if index.section == 1 {
                    if index.row == 0 {
                        // Menu 1-2
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 1-2 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                    else if index.row == 1 {
                        // Menu 2-2
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 2-2 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                }
                else if index.section == 2 {
                    if index.row == 0 {
                        // Menu 1-3
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 1-3 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                    else if index.row == 1 {
                        // Menu 2-3
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        vc.strTitle = "Menu 2-3 Controller"
                        self.navigationController?.pushViewController(vc, animated: false)
                    }
                }
            }
        }
    }
    
    // MARK: - API Call
    
}
