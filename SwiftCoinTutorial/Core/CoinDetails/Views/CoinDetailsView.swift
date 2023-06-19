//
//  CoreDetailsView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/18/23.
//

import SwiftUI

struct CoinDetailsView: View {
    let model: CoinDetailsSectionModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                // chart
                
                // overview
                CoinDetailsSection(model: model)
                    .padding(.vertical)
                
                Divider()
                
                // additional details
                CoinDetailsSection(model: model)
                    .padding(.vertical)
            }
            .padding()
            .navigationTitle("Bitcoin")
        }
    }
}

struct CoreDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(model: dev.sectionModel)
    }
}
