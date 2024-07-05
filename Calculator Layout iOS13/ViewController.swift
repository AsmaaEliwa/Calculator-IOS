//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ResultLabel: UILabel!
    var firstNum = ""
    var secNum = ""
    var result:Float = 0.0
    var isFinishTyping = false
    var finish = false
    var operation:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func MethodPressed(_ sender: UIButton) {
        result = Float(firstNum) ?? 0.0
       
        
        if sender.currentTitle == "AC" {
            
            firstNum = ""
            secNum = ""
            result = 0
            ResultLabel.text = String(result)
        }
            else if sender.currentTitle != "=" {
                isFinishTyping = true
            operation = sender.currentTitle

        }
        else {
            isFinishTyping = false
            switch operation{
            case "+":
                result+=Float(secNum)!
                
                print("add")
            case "-":
                print("-")
                result-=Float(secNum) ?? 0.0
            case "%":
                result/=Float(secNum) ?? 0.0
            case "*":
                result*=Float(secNum) ?? 0.0
             default:
                print("not recognized")
            }
            ResultLabel.text = String(result)
        }
    
    }
    
    @IBAction func NumberPressed(_ sender: UIButton) {
        if isFinishTyping {
            secNum += sender.currentTitle ?? ""
            ResultLabel.text = secNum
        }else{
            firstNum += sender.currentTitle ?? ""
            ResultLabel.text = firstNum
        }
    }
}

