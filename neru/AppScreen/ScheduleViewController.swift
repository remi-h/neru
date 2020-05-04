//
//  ScheduleViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let scheduleTableView:UITableView = UITableView()
    
    let times:[String] = [
        "00:00",
        "06:30",
        "07:30",
        "15:30",
        "18:30",
        "19:30",
        "20:30",
        "22:00",
        "24:00"
    ]
    let text:[String] = [
        "sleep",
        "wake up",
        "Go to school",
        "Club activity",
        "Back to home",
        "Dinner",
        "Study",
        "Hobby / Private",
        "sleep"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "SCHEDULE"
        self.navigationItem.title = "SCHEDULE"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        scheduleTableView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        scheduleTableView.delegate = self
        scheduleTableView.dataSource = self
        scheduleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.view.addSubview(scheduleTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: .value1 , reuseIdentifier: "MyCell")
        cell.textLabel?.text = times[indexPath.row]
        cell.detailTextLabel?.text = text[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
