//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let userHeight = String(format: "%.2f", sender.value)
        heightLabel.text = "\(userHeight)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let userWeight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(userWeight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let userHeight = heightSlider.value
        let userWeight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: userHeight, weight: userWeight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.colour = calculatorBrain.getColour()
        }
    }
}
