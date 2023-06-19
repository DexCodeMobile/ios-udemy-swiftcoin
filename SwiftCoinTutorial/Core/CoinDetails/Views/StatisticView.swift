//
//  StatisticView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/18/23.
//

import SwiftUI

struct StatisticView: View {
    let model: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
            
            Text(model.value)
                .font(.headline)
            
            if let percentageChange = model.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: percentageChange > 0.0 ? "triangle.fill" : "triangle.fill")
                        .font(.caption)
                    
                    Text("\(percentageChange.percentage)")
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(.green)
            }
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(model: dev.stat1)
    }
}
