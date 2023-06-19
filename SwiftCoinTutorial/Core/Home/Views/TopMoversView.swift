//
//  TopMoversView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/17/23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            CoinDetailsView()
                        } label: {
                            TopMoversItemView(coin: coin)
                        }

                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
