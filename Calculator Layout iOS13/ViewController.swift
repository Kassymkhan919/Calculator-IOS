//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelOutput.text = ""
        // Do any additional setup after loading the view.
    }
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var performingMath = false
    
    var operation = 0
    
    @IBOutlet weak var labelOutput: UILabel!
   
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true{
            labelOutput.text = String(sender.tag-1)
//            if sender.currentTitle == "."{
//                labelOutput.text = sender.currentTitle
//            }
            
                
            firstNumber = Double(labelOutput.text!)!
            performingMath = false
        }
        else{
            labelOutput.text = labelOutput.text! + String(sender.tag - 1)
            firstNumber = Double(labelOutput.text!)!
        }
        
    }
    


    
    
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if labelOutput.text != "" && sender.tag != 11 && sender.tag != 16 {
            secondNumber = Double(labelOutput.text!)!
            
            
            switch sender.tag{
            case 12:
                labelOutput.text = "/"
            case 13:
                labelOutput.text = "x"
            case 14:
                labelOutput.text = "-"
            case 15:
                labelOutput.text = "+"
            case 17:
                labelOutput.text = "%"
            case 18:
                labelOutput.text = "-\(String(describing: labelOutput.text!))"
            case 19:
                labelOutput.text = "\(String(describing: labelOutput.text!))."
            default:
                labelOutput.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            switch operation {
            case 12:
                labelOutput.text = String(secondNumber/firstNumber)
            case 13:
                labelOutput.text = String(secondNumber*firstNumber)
            case 14:
                labelOutput.text = String(secondNumber-firstNumber)
            case 15:
                labelOutput.text = String(secondNumber+firstNumber)
            case 17:
                labelOutput.text = calculatePercentage(value: firstNumber, percentageVal: secondNumber)
            default:
                labelOutput.text = String(secondNumber+firstNumber)
            }
        }
        else if sender.tag == 11 {
            labelOutput.text = ""
            secondNumber = 0
            firstNumber = 0
            operation = 0
        }
    }
    
    public func calculatePercentage(value: Double, percentageVal: Double)->String{
        let val = value * percentageVal
        return String(val / 100.0)
    }
    
}


