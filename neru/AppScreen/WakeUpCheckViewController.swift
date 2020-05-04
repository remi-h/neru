//
//  WakeUpCheckViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit

class WakeUpCheckViewController: UIViewController {
    
    let titleLabel:UILabel = UILabel()
    
    let greatButton:UIButton = UIButton()
    let goodButton:UIButton = UIButton()
    let badButton:UIButton = UIButton()
    
    let greatLabel:UILabel = UILabel()
    let goodLabel:UILabel = UILabel()
    let badLabel:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "WakeUp Time"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: width-20, height: 50)
        titleLabel.text = "Your sleep was ..."
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        titleLabel.layer.position = CGPoint(x: width/2, y: height/10*2)
        titleLabel.textColor = UIColor.black
        self.view.addSubview(titleLabel)
        
        greatButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        greatButton.setTitle("😆", for: .normal)
        greatButton.titleLabel?.textAlignment = .center
        greatButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        greatButton.layer.position = CGPoint(x: width/4*1, y: height/10*4)
        greatButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(greatButton)
        
        goodButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        goodButton.setTitle("😀", for: .normal)
        goodButton.titleLabel?.textAlignment = .center
        goodButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        goodButton.layer.position = CGPoint(x: width/4*2, y: height/10*4)
        goodButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(goodButton)
        
        badButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        badButton.setTitle("😥", for: .normal)
        badButton.titleLabel?.textAlignment = .center
        badButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        badButton.layer.position = CGPoint(x: width/4*3, y: height/10*4)
        badButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(badButton)
        
        
        greatLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        greatLabel.text = "Great"
        greatLabel.textAlignment = .center
        greatLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        greatLabel.layer.position = CGPoint(x: width/4*1, y: height/10*5)
        self.view.addSubview(greatLabel)
        
        goodLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        goodLabel.text = "Good"
        goodLabel.textAlignment = .center
        goodLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        goodLabel.layer.position = CGPoint(x: width/4*2, y: height/10*5)
        self.view.addSubview(goodLabel)
        
        badLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        badLabel.text = "Bad"
        badLabel.textAlignment = .center
        badLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        badLabel.layer.position = CGPoint(x: width/4*3, y: height/10*5)
        self.view.addSubview(badLabel)
        
        
    }
    
    @objc func buttonTapped(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
        //navigationController?.popToRootViewController(animated: true)
    }
    
}
