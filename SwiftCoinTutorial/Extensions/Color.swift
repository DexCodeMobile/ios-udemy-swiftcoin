//
//  Color.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/18/23.
//

import Foundation
import SwiftUI

struct ColorTheme {
    let primaryTextColor: Color = .primaryText
    let itemBackgroundColor: Color = .itemBackground
}

extension Color {
    static let theme: ColorTheme = ColorTheme()
    
    static var primaryText: Color {
        return Color("PrimaryTextColor")
    }
    
    static var itemBackground: Color {
        return Color("ItemBackgroundColor")
    }
}
