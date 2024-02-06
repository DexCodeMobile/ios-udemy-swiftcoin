//
//  ChartData.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/19/23.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let price: Double
}
