//
//  CoreDetailsView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/18/23.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    var chartLineColor: Color {
        viewModel.isPricePositive ? .green : .red
    }
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            // chart
            ChartView(viewModel: viewModel)
                .frame(height: 250)
                .padding(.vertical)
                .shadow(color: chartLineColor, radius: 10)
                .shadow(color: chartLineColor.opacity(0.2), radius: 10)
            
            // overview
            CoinDetailsSection(model: viewModel.overviewSectionModel)
                .padding(.vertical)
            
            Divider()
            
            // additional details
            CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
                .padding(.vertical)
        }
        .padding()
        .navigationTitle(viewModel.coinName)
    }
}

struct CoreDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}
