//
//  ViewController.swift
//  Calculator
//
//  Created by Rebekka Orth on 26/05/2018.
//  Copyright © 2018 Rebekka Orth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber : Double = 0
    var operatorSign : String = ""
    var secondNumber : Double = 0

    @IBOutlet weak var calculation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numericButton(_ sender: UIButton) {
        
        if sender.tag == 18 {
            calculation.text = "-"
            firstNumber = 0
            operatorSign = ""
            secondNumber = 0
        }
        else if sender.tag > -1 && sender.tag < 10 { //numeric buttons
            if newCalculation() {
                calculation.text = String(sender.tag)
            } else {
                calculation.text = calculation.text! + String(sender.tag)
            }
        } else if sender.tag > 9 && sender.tag < 19 { //operator buttons
            if sender.tag == 10 {
                if newCalculation() {
                    calculation.text = String (0) + "."
                } else {
                    calculation.text = calculation.text! + "."
                }
            } else if sender.tag == 11 {
                secondNumber = Double(calculation.text!)!
                print(firstNumber)
                print(secondNumber)
                print(operatorSign)
                let resultOfCalculation = calculate(numOne: firstNumber, numTwo: secondNumber, operatorNameGiven: operatorSign)
                calculation.text = String(resultOfCalculation)
                firstNumber = resultOfCalculation
            } else if sender.tag == 16 {
                calculation.text = String (Double(calculation.text!)! / 100)
            }  else {
                firstNumber = Double(calculation.text!)!
                print(firstNumber)
                switch sender.tag {
                case 12:
                    operatorSign = "+"
                case 13:
                    operatorSign = "-"
                case 14:
                    operatorSign = "*"
                case 15:
                    operatorSign = "/"
                default:
                    operatorSign = ""
                }
                calculation.text = "-"
            }
        
        }
    }
    
    func newCalculation () -> Bool {
        if calculation.text == "-" {
            return true
        } else {
            return false
        }
    }
    
    func calculate (numOne : Double, numTwo : Double, operatorNameGiven : String) -> Double {
        switch operatorNameGiven {
        case "+":
            return numOne + numTwo
        case "-":
            return numOne - numTwo
        case "*":
            return numOne * numTwo
        case "/":
            return numOne / numTwo
        default:
            return 0.0
    }
    }
}

