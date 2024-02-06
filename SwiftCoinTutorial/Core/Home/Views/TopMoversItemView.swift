//
//  TopMoversItemView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/17/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            // Coin Info
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.theme.primaryTextColor)
                
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Coin percentage change
            Text("\(coin.priceChangePercentage24H.percentage)")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : coin.priceChangePercentage24H == 0 ? .gray : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color.theme.itemBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
