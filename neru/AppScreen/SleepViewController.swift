//
//  SleepViewController.swift
//  neruneru
//
//  Created by Kirie Miyajima on 2018/04/20.
//  Copyright © 2018年 Remi Higuchi. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SleepViewController: UIViewController, AVAudioPlayerDelegate {
    
    let titleLabel:UILabel = UILabel()
    let emojiLabel:UILabel = UILabel()
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.themeColor
        self.title = "WakeUp Time"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: width-20, height: height)
        titleLabel.text = "Good night"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.layer.position = CGPoint(x: width/2, y: height/10*1.5)
        self.view.addSubview(titleLabel)
        
        emojiLabel.frame = CGRect(x: 0, y: 0, width: width, height: height)
        emojiLabel.text = "😴"
        emojiLabel.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        emojiLabel.textAlignment = .center
        emojiLabel.layer.position = CGPoint(x: width/2, y: height/10*6)
        self.view.addSubview(emojiLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            
            //let audioPath = NSURL(fileURLWithPath: Bundle.main.pathForResource("sounds", ofType: "mp3")!)
            let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: "sounds", ofType: "mp3")!)
            do {
                // AVAudioPlayerを作成。もし何かの事情で作成できなかったらエラーがthrowされる
                self.audioPlayer = try AVAudioPlayer(contentsOf: audioPath)
                
                // イベントを通知したいUIViewControllerをdelegateに登録
                // delegateの登録するならAVAudioPlayerDelegateプロトコルの継承が必要
                self.audioPlayer.delegate = self as! AVAudioPlayerDelegate
                
                // これで再生
                self.audioPlayer.play()
            }
                // playerを作成した時にエラーがthrowされたらこっち来る
            catch {
                print("AVAudioPlayer error")
            }
            
            
            self.showAlert()
        }
        
    }
    
    func showAlert(){
        let alertController:UIAlertController = UIAlertController(title: "GOOD MORNING!", message: "Wake up now!", preferredStyle: .alert)
        let action:UIAlertAction = UIAlertAction(title: "Wake up", style: .default) { (action) in
            self.audioPlayer.stop()
            self.pushNextVC()
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func pushNextVC() {
        self.navigationController?.pushViewController(WakeUpCheckViewController(), animated: true)
    }
    
    
    
}
