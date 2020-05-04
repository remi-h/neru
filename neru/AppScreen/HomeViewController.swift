//
//  HomeViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit
import Charts

class HomeViewController: UIViewController {
    
    let alarmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "HOME"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        
        //charts
        let chartView:PieChartView = PieChartView()
        chartView.frame = CGRect(x: 0, y: 0, width: width-20, height: width-20)
        chartView.layer.position = CGPoint(x: width/2, y: height/10*4)
        chartView.usePercentValuesEnabled = true
        chartView.centerText = "SLEEP"
        self.view.addSubview(chartView)
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let sleepTime:Double = appDelegate.sleepTimes
        
        
        let sections:[String] = ["sleep", "school", "club", "study", "private"]
        
        let schoolTime:Double = (24-sleepTime)/15*7
        let clubTime:Double = (24-sleepTime)/15*3
        let studyTime:Double = (24-sleepTime)/15*2
        let privateTime:Double = (24-sleepTime)/15*3
        
        let times:[Double] = [sleepTime,schoolTime,clubTime,studyTime,privateTime]
        var entries = [PieChartDataEntry]()
        
        for(index, value) in times.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = sections[index]
            entries.append(entry)
        }
        
        let set = PieChartDataSet(values: entries, label: "Your schedule")
        var colors:[UIColor] = [
            UIColor(red:0.87, green:0.39, blue:0.31, alpha:1.00),
            UIColor(red:0.83, green:0.46, blue:0.66, alpha:1.00),
            UIColor(red:0.71, green:0.83, blue:0.40, alpha:1.00),
            UIColor(red:0.60, green:0.80, blue:0.54, alpha:1.00),
            UIColor(red:0.50, green:0.78, blue:0.73, alpha:1.00)
        ]
        
        
        set.colors = colors
        let data = PieChartData(dataSet: set)
        chartView.data = data
        chartView.noDataText = "No data available"
        
        self.view.addSubview(chartView)
        
        alarmButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        alarmButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        alarmButton.layer.position = CGPoint(x: width/2, y: height/10*8)
        alarmButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(alarmButton)
    }
    
    @objc func buttonTapped(){
        self.present(UINavigationController(rootViewController: SetWakeUpTimeViewController()), animated: true, completion: nil)
    }
    
}
