//
//  ViewController.swift
//  uitest
//
//  Created by michael chan on 2017/9/15.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import UIKit

var isUserInTheMiddleOfTyping = false

class ViewController: UIViewController {

    @IBOutlet weak var resultDispaly: UILabel!
    @IBAction func numberOnClick(_ sender: UIButton) {
        let number = sender.currentTitle!
        print(number)
        if isUserInTheMiddleOfTyping{
            resultDispaly.text = resultDispaly.text! + number
        }else{
            resultDispaly.text = number
            isUserInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        set{
           resultDispaly.text = String(newValue)
        }
        get{
            return Double(resultDispaly.text!)!
        }
    }
    
    var brain = CalculatorModel()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if isUserInTheMiddleOfTyping{
            brain.setLeft(operand: displayValue)
            isUserInTheMiddleOfTyping = false
        }
        isUserInTheMiddleOfTyping = false
        let operant = sender.currentTitle!
        brain.performOperation(symbol: operant)
        displayValue = brain.result

    }
    
}

