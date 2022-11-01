//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var finishTypeNumber: Bool = true
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {
                fatalError("there error here")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        finishTypeNumber = true
       
        
        if let calMethod = sender.currentTitle{
            if calMethod == "+/-"{
                displayValue = displayValue * -1
            }else if calMethod == "AC"{
                displayLabel.text = "0"
            }else if calMethod == "%"{
                displayValue = displayValue / 100
            }
        }
        
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if finishTypeNumber == true{
                displayLabel.text = numValue
                finishTypeNumber = false
            }else{
                if numValue == "."{
                let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                    
            }
                
                
                displayLabel.text! += numValue
            }
        }
        
        
    
    }

}

