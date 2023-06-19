//
//  CoinRowView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/17/23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            // Market cap rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            
            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            // Coin name info
            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
                
            }
            .padding(.leading, 2)
            .foregroundColor(.theme.primaryTextColor)
            
            Spacer()

            // Coin price info
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                    .foregroundColor(.theme.primaryTextColor)
                
                Text("\(coin.priceChangePercentage24H.percentage)")
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : coin.priceChangePercentage24H == 0 ? .gray : .red)
                    .padding(.leading, 6)
                
            }
            .foregroundColor(.theme.primaryTextColor)
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
