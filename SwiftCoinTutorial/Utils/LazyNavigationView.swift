//
//  LazyNavigationView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/19/23.
//

import Foundation
import SwiftUI

struct LazyNavigationView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
