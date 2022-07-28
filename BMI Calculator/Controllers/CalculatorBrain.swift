//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jack Winterschladen on 28/07/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?

    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice."
    }
    
    func getColour() -> UIColor {
        return bmi?.colour ?? .blue
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "You need more calories!", colour: .cyan)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as!", colour: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "You may need less calories...", colour: .red)
        }
    }
    
}
