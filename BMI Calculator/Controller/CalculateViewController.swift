//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Manuvela on 22/01/24.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightToChoose: UITextField!
    
    @IBOutlet weak var weightToChoose: UITextField!
    
    let arr = ["meters", "cm", "feet"]
    let arr1 = ["kg", "pounds"]
    
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()

    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    
    var calculatorBrain = CalculatorBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        heightToChoose.inputView = pickerView1
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        weightToChoose.inputView = pickerView2
        
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = String(format: "%.2f", sender.value) + " " + heightToChoose.text!
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(Int(sender.value)) + " " + weightToChoose.text!
    }
    
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let h = heightToChoose.text!
        let w = weightToChoose.text!
        calculatorBrain.calculateBMI(height : height, weight : weight, h : h, w : w)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVc = segue.destination as! ResultViewController
            destinationVc.bmiValue = calculatorBrain.getBMIValue()
            
            destinationVc.bmiAdvice = calculatorBrain.getAdvice()
            destinationVc.color = calculatorBrain.getColor()
            
        }
    }
    
    @IBAction func unitsButton(_ sender: UIButton) {
        
        let h = heightToChoose.text!
        let w = weightToChoose.text!
        
        if(h == "meters"){
            heightSlider.minimumValue = 0
            heightSlider.maximumValue = 3
        }
        if(h == "cm"){
            heightSlider.minimumValue = 0
            heightSlider.maximumValue = 300
        }
        if(h == "feet"){
            heightSlider.minimumValue = 0
            heightSlider.maximumValue = 10
        }
        
        if(w == "kg"){
            weightSlider.minimumValue = 0
            weightSlider.maximumValue = 200
        }
        
        if(w == "pounds"){
            weightSlider.minimumValue = 0
            weightSlider.maximumValue = 300
        }
        print(h)
        print(w)
    }
    
    
}

extension CalculateViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    public func numberOfComponents(in pickerView1: UIPickerView) -> Int {
        return 1
    }
    
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows = arr.count
        if(pickerView == pickerView2){
            countrows = self.arr1.count
        }
        return countrows
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(pickerView == pickerView1){
            let titleRow = arr[row]
            return titleRow
        }
        else if(pickerView == pickerView2){
            let titleRow = arr1[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == pickerView1){
            self.heightToChoose.text = self.arr[row]
            heightToChoose.resignFirstResponder()
        }
        else if(pickerView == pickerView2){
            self.weightToChoose.text = self.arr1[row]
            weightToChoose.resignFirstResponder()
        }
        

    }
}

