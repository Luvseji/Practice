//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Константин Машейченко on 01.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let rate: Double
    var rateString: String {
        return String(format: "%.2f", rate)
    }
    let currency: String
}
