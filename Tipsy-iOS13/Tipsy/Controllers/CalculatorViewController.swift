//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsyBrain = TipsyBrain()
    var tips: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIClear()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle! == "0%" {
            UIClear()
            zeroButton.isSelected = true
            tips = 0.0
        } else if sender.currentTitle! == "10%" {
            UIClear()
            tenButton.isSelected = true
            tips = 0.1
        } else {
            UIClear()
            twentyButton.isSelected = true
            tips = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text != "" {
            tipsyBrain.calculateTotal(bill: Float(billTextField.text!)!, tips: tips, persons: Int(splitNumberLabel.text!)!)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = tipsyBrain.getTotal()
            destinationVC.persons = Int(splitNumberLabel.text!)!
            destinationVC.tips = tips
        }
    }
    
    func UIClear() {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
    }
}

