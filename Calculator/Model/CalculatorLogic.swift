//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mamdouh on 05/11/2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    private var intermediateCalculator : (n1 : Double, calMethod: String)?
    
     mutating func setnumber (_ number: Double){
        self.number = number
        
    }
    
    mutating func calculate (symbol: String)->Double?{
        if let n = number{
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performCalculation(n2: n)
            default:
                intermediateCalculator = (n1: n, calMethod: symbol)
            }
        }
       return nil
    }
    
    private func performCalculation(n2: Double)-> Double? {
    
        if let n1 = intermediateCalculator?.n1,
           let operation = intermediateCalculator?.calMethod{

            switch operation {
            case "+":
                return n1+n2
            case "-":
                return n1-n2
            case "×":
                return n1*n2
            case "÷":
                return n1/n2
            default:
                fatalError("the operation is passing doesn't match with any we have")
            }
            
        }
        return nil
        
    }
    
    
    
}
