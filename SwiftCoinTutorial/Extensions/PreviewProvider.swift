//
//  PreviewProvider.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/18/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.share
    }
}

class DeveloperPreview {
    static let share = DeveloperPreview()
    
    let stat1 = StatisticModel(
        title: "Current Price",
        value: "$21,543.00",
        percentageChange: 1.23
    )
    
    let stat2 = StatisticModel(
        title: "Market Capitalization",
        value: "$413.15Bn",
        percentageChange: 1.67
    )
    
    let stat3 = StatisticModel(
        title: "Rank",
        value: "$413.15Bn",
        percentageChange: nil
    )
    
    let stat4 = StatisticModel(
        title: "Volume",
        value: "$35.99Bn",
        percentageChange: nil
    )
    
    let sectionModel = CoinDetailsSectionModel(title: "Overview", stats: [share.stat1, share.stat2, share.stat3, share.stat4])
}
