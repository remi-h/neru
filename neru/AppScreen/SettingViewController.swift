//
//  SettimgViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let settingTableView:UITableView = UITableView(frame: CGRect(), style: .grouped)
    
    let sections:[String] = [
        "Information",
        "App Settings"
    ]
    
    let infoTitles:[String] = [
        "How to use",
        "Developer team"
    ]
    
    let appTitles:[String] = [
        "App Version"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "Settings"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        settingTableView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        settingTableView.allowsSelection = false
        self.view.addSubview(settingTableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return infoTitles.count
        }else if section == 1 {
            return appTitles.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "MyCell")
        
        if indexPath.section == 0 {
            cell.textLabel?.text = infoTitles[indexPath.row]
        }else if indexPath.section == 1 {
            cell.textLabel?.text = appTitles[indexPath.row]
            cell.detailTextLabel?.text = "v1.0 β"
        }
        return cell
        
    }
    
    
}
