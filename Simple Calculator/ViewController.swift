//
//  ViewController.swift
//  Calculator
//
//  Created by Harvey Wang on 2017-05-05.
//  Copyright © 2017 Harvey Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    var operand1 = 0
    var operation: String? = nil
    var cleared = false
    @IBOutlet weak var label📌: UILabel!
    
    
    
    //MARK: Actions
    
    @IBAction func clear(_ sender: UIButton) {
        operand1 = 0
        operation = nil
        cleared = false
        label📌.text = "0"
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        // Entering operands
        if isInt(string🔤: sender.currentTitle!) {
            
            // 2nd operand
            if (operation != nil) {
                if cleared == false {
                    label📌.text = sender.currentTitle
                    cleared = true
                }
                else {
                    label📌.text?.append(sender.currentTitle!)
                }
            }
                
            // 1st operand
            else {
                label📌.text = label📌.text == "0" ? sender.currentTitle : label📌.text! + sender.currentTitle!
            }
        }
    
        // Entering operation
        else if !(sender.currentTitle == "=") {
            operand1 = Int(label📌.text!)!
            operation = sender.currentTitle
            cleared = false
        }
        
        // Equal button pressed
        else {
            switch operation {
            case "+"?:
                label📌.text = String (operand1 + Int(label📌.text!)!)
            case "-"?:
                label📌.text = String (operand1 - Int(label📌.text!)!)
            case "*"?:
                label📌.text = String (operand1 * Int(label📌.text!)!)
            default:
                if (operand1 == 0 || Int(label📌.text!)! == 0) {
                    label📌.text = "0"
                }
                else {
                    label📌.text = String (operand1 / Int(label📌.text!)!)
                }
            }
            
            operand1 = Int(label📌.text!)!
            cleared = false
        }
        
    }
    
    
    
    
    //MARK: Methods
    
    /*
    private func infixToPostfix(inputString📲: String) {
        var stack🗃: [String]
        for i in 0..<inputString📲.characters.count {
            let index = inputString📲.index(inputString📲.startIndex, offsetBy: i)
            if isInt(string🔤: String(inputString📲[index])) {
                var num = Int(String(inputString📲[index]))
                print(num!)
            }
            else {
                
            }
        }
    }
    */
    
    private func isInt(string🔤: String) -> Bool {
        let int🔢 = Int(string🔤)
        print(int🔢 != nil)
        return int🔢 != nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label📌.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

