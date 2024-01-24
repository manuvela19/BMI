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
    
    
    
    
    
    mutating func calculateBMI(height : Float, weight : Float, h : String, w : String){
    
        
        let advice1 = "Eat more pies"
        let advice2 = "perfect"
        let advice3 = "EAt less pies"
        
        let color1 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.9)
        let color2 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9)
        let color3 = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
        
        
        switch(h, w){
            
          case ("meters", "kg") :
            let bmiValue = weight / (height * height)
                if(bmiValue < 18.5){
                    bmi = BMI(value: bmiValue, advice: advice1, color: color1)
                }
                else if(bmiValue < 24.9){
                    bmi = BMI(value: bmiValue, advice: advice2, color: color2)
                }
                else{
                    bmi = BMI(value: bmiValue, advice: advice3, color: color3)
                }
            
          case ("meters", "pounds") :
            let bmiValue = weight * 0.453592 / (height * height)
            if(bmiValue < 18.5){
                bmi = BMI(value: bmiValue, advice: advice1, color: color1)
            }
            else if(bmiValue < 24.9){
                bmi = BMI(value: bmiValue, advice: advice2, color: color2)
            }
            else{
                bmi = BMI(value: bmiValue, advice: advice3, color: color3)
            }
            
        case ("cm", "kg") :
            let bmiValue = (weight / (height * height)) * 10000
          if(bmiValue < 18.5){
              bmi = BMI(value: bmiValue, advice: advice1, color: color1)
          }
          else if(bmiValue < 24.9){
              bmi = BMI(value: bmiValue, advice: advice2, color: color2)
          }
          else{
              bmi = BMI(value: bmiValue, advice: advice3, color: color3)
          }
            
        case ("cm", "pounds") :
            let bmiValue = (weight * 0.453592 / (height * height)) * 10000
          if(bmiValue < 18.5){
              bmi = BMI(value: bmiValue, advice: advice1, color: color1)
          }
          else if(bmiValue < 24.9){
              bmi = BMI(value: bmiValue, advice: advice2, color: color2)
          }
          else{
              bmi = BMI(value: bmiValue, advice: advice3, color: color3)
          }
            
        case ("feet", "kg") :
            let bmiValue = weight / (height * height * 0.3048 * 0.3048)
          if(bmiValue < 18.5){
              bmi = BMI(value: bmiValue, advice: advice1, color: color1)
          }
          else if(bmiValue < 24.9){
              bmi = BMI(value: bmiValue, advice: advice2, color: color2)
          }
          else{
              bmi = BMI(value: bmiValue, advice: advice3, color: color3)
          }
            
        case ("feet", "pounds") :
            let bmiValue = (weight * 0.453592 / (height * height * 0.3048 * 0.3048)) 
          if(bmiValue < 18.5){
              bmi = BMI(value: bmiValue, advice: advice1, color: color1)
          }
          else if(bmiValue < 24.9){
              bmi = BMI(value: bmiValue, advice: advice2, color: color2)
          }
          else{
              bmi = BMI(value: bmiValue, advice: advice3, color: color3)
          }
        
        case (_, _):
            print("default")
        }
        
        
        
        
        
        
    }
}
