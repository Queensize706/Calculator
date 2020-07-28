//
//  ViewController.swift
//  Calculator
//
//  Created by Violence on 3/21/19.
//  Copyright © 2019 Violence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operatorFlag: String = ""
    var operatorValue = 0.0
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDIgit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }

    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    
    
    @IBAction func performanceOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol{
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            case "+":
                operatorFlag = "+"
                operatorValue = displayValue
            case "-":
                operatorFlag = "-"
                operatorValue = displayValue
            case "=":
                if operatorFlag == "+"{
                    displayValue = displayValue + operatorValue
                }
                if operatorFlag == "-"{
                    displayValue = operatorValue - displayValue
                }
            case "AC":
                display.text = String(0)
            default:
                break
            }
        }
    }
    
    
}

