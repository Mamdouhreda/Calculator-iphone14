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
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        finishTypeNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("there error here")
        }
        
        if let calMethod = sender.currentTitle{
            if calMethod == "+/-"{
                displayLabel.text = String(number * -1)
            }else if calMethod == "AC"{
                displayLabel.text = "0"
            }else if calMethod == "%"{
                displayLabel.text = String(number / 100)
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
                guard let currentDisplayValue = Double(displayLabel.text!)else
                {
                    fatalError("error here")
                }
                let isInt = floor(currentDisplayValue) == currentDisplayValue
                    if !isInt{
                        return
                    }
                    
            }
                
                
                displayLabel.text! += numValue
            }
        }
        
        
    
    }

}

