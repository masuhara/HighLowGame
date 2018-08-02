//
//  ViewController.swift
//  HighRowGame
//
//  Created by Masuhara on 2018/08/03.
//  Copyright © 2018年 Ylab, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number1: Int = 0
    var number2: Int = 0
    
    @IBOutlet var number1Label: UILabel!
    @IBOutlet var number2Label: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var highButton: UIButton!
    @IBOutlet var lowButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 数字のリセット
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func high() {
        number2Label.text = String(number2)
        
        if number2 > number1 {
            resultLabel.text = "正解！"
            resultLabel.textColor = UIColor.red
            
            // 結果の保存
            saveResult(result: true)
        } else {
            resultLabel.text = "不正解..."
            resultLabel.textColor = UIColor.blue
            
            // 結果の保存
            saveResult(result: false)
        }
        highButton.isEnabled = false
        lowButton.isEnabled = false
    }
    
    @IBAction func low() {
        number2Label.text = String(number2)
        
        if number2 < number1 {
            resultLabel.text = "正解！"
            resultLabel.textColor = UIColor.red
            
            // 結果の保存
            saveResult(result: true)
        } else {
            resultLabel.text = "不正解..."
            resultLabel.textColor = UIColor.blue
            
            // 結果の保存
            saveResult(result: false)
        }
        highButton.isEnabled = false
        lowButton.isEnabled = false
    }
    
    @IBAction func reset() {
        number1 = Int(arc4random_uniform(100))
        number2 = Int(arc4random_uniform(100))
        
        number1Label.text = String(number1)
        number2Label.text = "??"
        resultLabel.text = ""
        resultLabel.textColor = UIColor.black
        
        highButton.isEnabled = true
        lowButton.isEnabled = true
        
        showScore()
    }
    
    func showScore() {
        let ud = UserDefaults.standard
        let resultArray = ud.object(forKey: "resultArray") as? [Bool]
        if let resultArray = resultArray {
            var trueArray = [Bool]()
            for result in resultArray {
                if result == true {
                    trueArray.append(result)
                }
            }
            let score = (Double(trueArray.count) / Double(resultArray.count)) * 100
            scoreLabel.text = String(format: "正解率: %.0f%%", score)
        } else {
            scoreLabel.text = "スコアなし"
        }
    }
    
    func saveResult(result: Bool) {
        let ud = UserDefaults.standard
        let resultArray = ud.object(forKey: "resultArray") as? [Bool]
        if var resultArray = resultArray {
            resultArray.append(result)
            ud.set(resultArray, forKey: "resultArray")
        } else {
            var resultArray = [Bool]()
            resultArray.append(result)
            ud.set(resultArray, forKey: "resultArray")
        }
        ud.synchronize()
    }


}

