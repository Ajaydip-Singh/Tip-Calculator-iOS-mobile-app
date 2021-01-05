//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ajaydip Singh on 1/5/21.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var defaultTipLabel: UILabel!
    @IBOutlet weak var tipPicker: UIPickerView!
    
    let pickerData = ["15", "16", "17", "18", "19", "20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPicker.delegate = self
        tipPicker.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openTipSelector(_:)))
                defaultTipLabel.addGestureRecognizer(tap)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let defaults = UserDefaults.standard
        let defaultTip = defaults.string(forKey: "tipPercentage") ?? "15"
        defaultTipLabel.text = defaultTip
        let row = pickerData.firstIndex(of: defaultTip) ?? 0
        tipPicker.selectRow(row, inComponent: 0, animated: true)
    }
    
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let defaults = UserDefaults.standard
        
        switch row {
        case 0:
            defaults.setValue("15", forKey: "tipPercentage")
            defaultTipLabel.text = "15"
        case 1:
            defaults.setValue("16", forKey: "tipPercentage")
            defaultTipLabel.text = "16"
        case 2:
            defaults.setValue("17", forKey: "tipPercentage")
            defaultTipLabel.text = "17"
        case 3:
            defaults.setValue("18", forKey: "tipPercentage")
            defaultTipLabel.text = "18"
        case 4:
            defaults.setValue("19", forKey: "tipPercentage")
            defaultTipLabel.text = "19"
        default:
            defaults.setValue("20", forKey: "tipPercentage")
            defaultTipLabel.text = "20"
        }
        
    }
    
    
    @IBAction func openTipSelector(_ sender: Any) {
        tipPicker.isHidden = false
        doneButton.isHidden = false
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        tipPicker.isHidden = true
        doneButton.isHidden = true
        
    }
    
    
    @IBAction func onTipSelectionDone(_ sender: UIButton) {
        tipPicker.isHidden = true
        doneButton.isHidden = true
    }
    
    
    
    
}
