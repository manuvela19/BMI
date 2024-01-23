//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Manuvela on 23/01/24.
//

import Foundation
import UIKit

struct CalculatorBrain{
    
    var bmi : BMI?
    
   
    
     func getBMIValue() -> String{
         let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
             return bmiValue
    }
    
    func getAdvice() -> String{
        let bmiAdvice = bmi?.advice
            return bmiAdvice!
   }
    
    func getColor() -> UIColor{
        let bmiColor = bmi?.color
            return bmiColor!
   }
    
    
    
    
    
    mutating func calculateBMI(height : Float, weight : Float){
        
         let bmiValue = weight / (height * height)
        
        
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor(red: 0, green: 0, blue: 1, alpha: 0.9))
        }
        else if(bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "perfect", color: UIColor(red: 0, green: 1, blue: 0, alpha: 0.9))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "EAt less pies", color: UIColor(red: 1, green: 0, blue: 0, alpha: 0.9))
        }
        
        
        
    }
}
