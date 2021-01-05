//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Ajaydip Singh on 1/5/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let defaults = UserDefaults.standard
        let defaultTip = defaults.string(forKey: "tipPercentage") ?? "15"
        defaultTipTextField.text = defaultTip
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaults = UserDefaults.standard
        defaults.setValue(defaultTipTextField.text, forKey: "tipPercentage")
        
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}
