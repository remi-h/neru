//
//  FirstGetUpTimeViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/19.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class FirstGetUpTimeViewController: UIViewController {
    
    let titleLabel:UILabel = UILabel()
    let timePickerView:UIDatePicker = UIDatePicker()
    let sendButton:UIButton = UIButton()
    
    var timeFloat:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Get up time"
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        //label
        titleLabel.frame = CGRect(x: 0, y: 0, width: width-20, height: 50)
        titleLabel.text = "What time do you want to get up?"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.layer.position = CGPoint(x: width/2, y: height/10*1.5)
        self.view.addSubview(titleLabel)
        
        timePickerView.frame = CGRect(x: 0, y: 0, width: width/10*8, height: height/10*3)
        timePickerView.timeZone = TimeZone.current
        timePickerView.locale = Locale.current
        timePickerView.datePickerMode = .time
        timePickerView.layer.position = CGPoint(x: width/2, y: height/10*5)
        timePickerView.addTarget(self, action: #selector(timePickerChanged(sender:)), for: .valueChanged)
        self.view.addSubview(timePickerView)
        
        sendButton.frame = CGRect(x: 0, y: 0, width: width/10*5, height: 50)
        sendButton.backgroundColor = UIColor.themeColor
        sendButton.setTitle("next", for: .normal)
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        sendButton.layer.cornerRadius = 20
        sendButton.layer.masksToBounds = true
        sendButton.layer.position = CGPoint(x: width/2, y: height/10*8)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        self.view.addSubview(sendButton)
        
        
    }
    
    @objc func sendButtonTapped() {
        
        if timeFloat == 0 {
            let alertController = UIAlertController(title: "Error", message: "Please select your get up time.", preferredStyle: .alert)
            let action:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.sleepTimes = timeFloat
            self.navigationController?.pushViewController(FirstChartViewController(), animated: true)
        }
        
    }
    
    @objc func timePickerChanged(sender: UIDatePicker) {
        let gmtTime = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm:ss"
        let jpTime = dateFormatter.string(from: gmtTime)
        
        print("jpTime→ \(jpTime)")
        let hoursStr:String = String(jpTime.prefix(2))
        print("hoursStr→ \(hoursStr)")
        
        let hourtFloat:Double = Double(hoursStr)!
        
        let minutesStr:String = String(jpTime[jpTime.index(jpTime.startIndex, offsetBy: 3)..<jpTime.index(jpTime.startIndex, offsetBy: 5)])
        print(minutesStr)
        
        let minutesFloat:Double = Double(minutesStr)!/60
        
        timeFloat = hourtFloat + minutesFloat
        
        print(timeFloat)
        
    }
    
}
