//
//  SetWakeUpTimeVC.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class SetWakeUpTimeViewController: UIViewController {
    
    let closeButton = UIBarButtonItem()
    let timePickerView = UIDatePicker()
    let titleLabel:UILabel = UILabel()
    var timeFloat:Double = 0
    let setButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "WakeUp Time"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        closeButton.title = "close"
        closeButton.target = self
        closeButton.action = #selector(closeThisView)
        self.navigationItem.leftBarButtonItem = closeButton
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: width-20, height: 50)
        titleLabel.text = "What time do you want to get up?"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.layer.position = CGPoint(x: width/2, y: height/10*1.5)
        self.view.addSubview(titleLabel)
        
        timePickerView.frame = CGRect(x: 0, y: 0, width: width, height: height/10*6)
        timePickerView.timeZone = TimeZone.current
        timePickerView.locale = Locale.current
        timePickerView.datePickerMode = .time
        timePickerView.layer.position = CGPoint(x: width/2, y: height/10*5)
        timePickerView.addTarget(self, action: #selector(timePickerChanged(sender:)), for: .valueChanged)
        self.view.addSubview(timePickerView)
        
        setButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        setButton.setImage(#imageLiteral(resourceName: "alarm"), for: .normal)
        setButton.layer.position = CGPoint(x: width/2, y: height/10*8)
        setButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(setButton)
        
    }
    
    @objc func closeThisView(){
        self.dismiss(animated: true, completion: nil)
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
    
    @objc func buttonTapped(){
        self.navigationController?.pushViewController(SleepViewController(), animated: true)
    }

}
