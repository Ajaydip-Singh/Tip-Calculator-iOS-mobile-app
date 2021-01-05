//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ajaydip Singh on 12/20/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Float(billField.text!) ?? 0
        
        tipPercentageLabel.text = String(format: "$%.0f", tipSlider.value)
        
        let tip = bill * tipSlider.value/100
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

