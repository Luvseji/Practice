//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Константин Машейченко on 29.08.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    var tipsy: Tipsy?
    
    mutating func calculateTotal(bill: Float, tips: Float, persons: Int) {
        let total: Float = (bill + bill * tips) / Float(persons)
        tipsy = Tipsy(bill: bill, persons: persons, tips: tips, total: total)
    }
    
    func getTotal() -> String {
        let total = String(format: "%.2f", tipsy?.total ?? 0.0)
        return total
    }
}
