//
//  FirstUserInfoAddViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/19.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class FirstuserInfoAddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let titleLabel:UILabel = UILabel()
    
    let nameTF:UITextField = UITextField()
    let sexPickerView:UIPickerView = UIPickerView()
    let birthdayPickerView:UIDatePicker = UIDatePicker()
    let sendButton:UIButton = UIButton()
    
    let pickerViewItems:[String] = [
        "Female",
        "Male"
    ]
    
    override func viewDidLoad() {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        self.view.backgroundColor = UIColor.white
        self.title = "Welcome"
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: width-20, height: 50)
        titleLabel.text = "Enter your information!"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.layer.position = CGPoint(x: width/2, y: height/10*1.5)
        self.view.addSubview(titleLabel)
        
        nameTF.frame = CGRect(x: 0, y: 0, width: width/10*8, height: 50)
        nameTF.layer.borderWidth = 1
        nameTF.layer.borderColor = UIColor.black.cgColor
        nameTF.placeholder = "Your name"
        nameTF.textAlignment = .center
        nameTF.layer.position = CGPoint(x: width/2, y: height/10*2.5)
        self.view.addSubview(nameTF)
        
        sexPickerView.dataSource = self
        sexPickerView.delegate = self
        sexPickerView.frame = CGRect(x: 0, y: 0, width: width/10*8, height: 100)
        sexPickerView.layer.position = CGPoint(x: width/2, y: height/10*4)
        sexPickerView.tag = 1
        self.view.addSubview(sexPickerView)
        
        birthdayPickerView.frame = CGRect(x: 0, y: 0, width: width/10*8, height: 100)
        birthdayPickerView.timeZone = NSTimeZone.local
        birthdayPickerView.addTarget(self, action: #selector(birthDayPickerValueChanged(sender:)), for: .valueChanged)
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let defautlsDate = dateFormatter.date(from: "2000-03-18")
        
        birthdayPickerView.layer.position = CGPoint(x: width/2, y: height/10*6)
        birthdayPickerView.datePickerMode = .date
        
        birthdayPickerView.setDate(defautlsDate!, animated: true)
        self.view.addSubview(birthdayPickerView)
        
        sendButton.frame = CGRect(x: 0, y: 0, width: width/10*5, height: 50)
        sendButton.backgroundColor = UIColor.themeColor
        sendButton.setTitle("next", for: .normal)
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        sendButton.layer.cornerRadius = 20
        sendButton.layer.masksToBounds = true
        sendButton.layer.position = CGPoint(x: width/2, y: height/10*8)
        sendButton.addTarget(self, action: #selector(sendButtanTapped), for: .touchUpInside)
        self.view.addSubview(sendButton)
        
        let tapRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewItems[row]
    }
    
    @objc func birthDayPickerValueChanged(sender: UIDatePicker){
        
    }
    
    @objc func sendButtanTapped(sender: UIButton){
        self.navigationController?.pushViewController(FirstGetUpTimeViewController(), animated: true)
    }
    
    @objc func viewTapped(){
        nameTF.resignFirstResponder()
    }

    
}
