//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Константин Машейченко on 29.08.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var persons: Int?
    var tips: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        var currTips: String
        if tips == 0.0 {
            currTips = "0%"
        } else if tips == 0.1 {
            currTips = "10%"
        } else {
            currTips = "20%"

        }
        settingsLabel.text = "Split between \(persons ?? 2) people, with \(currTips) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
