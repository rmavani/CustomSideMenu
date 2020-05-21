//
//  SideMenu.swift
//  CustomSideMenu
//
//  Created by User on 21/05/20.
//  Copyright © 2020 Ravi Mavani. All rights reserved.
//

import UIKit
    
protocol DetailViewControllerDelegate: class {
    func didFinishTask(sender: SideMenu, index : IndexPath)
    func didSelectButton(sender : UIButton, strType : String)
}

class SideMenuCell: UITableViewCell {
    
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblIcon : UILabel!
    @IBOutlet var lblNotiCount : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class SideMenu: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - Enum Section
    enum Section:Int{
        case Home = 0
        case Other
    }
    
    // MARK: - Initialize IBOutlets
    @IBOutlet var viewNav : UIView!
    @IBOutlet var viewMain : UIView!
    
    @IBOutlet var tblMenu : UITableView!
    
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblContactNo : UILabel!
    
    @IBOutlet var topConstraint : NSLayoutConstraint!
    @IBOutlet var bottomConstraint : NSLayoutConstraint!
    
    // MARK: - Initialize Variables
    weak var delegate : DetailViewControllerDelegate?
    
    var selectedIndex : Int = 0
    
    var ArrSectionTitle = ["Section 1", "Section 2", "Section 3"]
    var ArrMenuName:[Int:Array<String>] = [0:["Menu 1-1", "Menu 2-1", "Menu 3-1"], 1:["Menu 1-2", "Menu 2-2"],2:["Menu 1-3", "Menu 2-3"]]
    var ArrMenuIcon:[Int:Array<String>] = [0:["\u{f015}", "\u{f015}", "\u{f015}"], 1:["\u{f015}", "\u{f015}"],2:["\u{f015}", "\u{f015}"]]
    
    // MARK: - Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMain.backgroundColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        topConstraint.constant = 0
        bottomConstraint.constant = 0
        if screenHeight >= 812 {
            topConstraint.constant = 44
            bottomConstraint.constant = 44
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.setUserData()
        self.tblMenu.reloadData()
    }
    
    // MARK: - UIButton Click Events
    @IBAction func Clk_btnHide(_ sender: UIButton) {
        self.view.endEditing(true)
        delegate?.didSelectButton(sender: sender, strType: "setting")
    }
    
    // MARK: - UITableViewDelegate and UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return ArrMenuName.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ArrMenuName[section])!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "SideMenuCell"
        var cell: SideMenuCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        if cell == nil {
            tableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        cell.lblName.textColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        cell.lblIcon.textColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        
        cell.lblName.text = (ArrMenuName[indexPath.section])?[indexPath.row]
        cell.lblIcon.text = (ArrMenuIcon[indexPath.section])?[indexPath.row]
        
        cell.lblNotiCount.backgroundColor = UIColor.connectColor(name: ColorRed, alpha: 1.0)
        cell.lblNotiCount.layer.cornerRadius = 17.0
        cell.lblNotiCount.layer.masksToBounds = true
        cell.lblNotiCount.isHidden = true
        if indexPath.section == 0 && indexPath.row == 1 {
            cell.lblNotiCount.isHidden = false
            let notiCount = 10
            cell.lblNotiCount.text = "\(notiCount)"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        delegate?.didFinishTask(sender: self, index: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        else {
            return 40.0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ArrSectionTitle[section]
    }
    
    // MARK: - Common Methods
    func setUserData() {
        viewNav.backgroundColor = UIColor.connectColor(name: ColorPrimary, alpha: 1.0)
        
        lblName.text = "User Name"
        lblContactNo.text = "User Mobile"
        
    }
    // MARK: - Other Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

