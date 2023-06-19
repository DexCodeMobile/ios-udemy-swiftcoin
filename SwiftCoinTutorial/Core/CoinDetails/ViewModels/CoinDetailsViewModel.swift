//
//  CoinDetailsViewModel.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/19/23.
//

import Foundation
import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin
    var chartData = [ChartData]()
    var startDate: Date = Date()
    var endDate: Date = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    var coinName: String {
        return coin.name
    }
    var isPricePositive: Bool {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0
    }
    var overviewSectionModel: CoinDetailsSectionModel {
        // price stats
        let price = coin.currentPrice.toCurrency()
        let pricePercentageChange = coin.priceChangePercentage24H
        let priceStats = StatisticModel(
            title: "Current Price",
            value: price,
            percentageChange: pricePercentageChange
        )
        
        // market cap stats
        let marketCap = coin.marketCap ?? 0
        let marketCapPercentageChange = coin.marketCapChangePercentage24H
        let marketCapStats = StatisticModel(
            title: "Market Capitalization",
            value: marketCap.formattedWithAbbreviations(),
            percentageChange: marketCapPercentageChange
        )
        
        // rank stats
        let rank = coin.marketCapRank
        let rankStats = StatisticModel(
            title: "Rank",
            value: String(rank),
            percentageChange: nil
        )
        
        // volume stats
        let volume = coin.totalVolume ?? 0
        let volumeStats = StatisticModel(
            title: "Market Cap",
            value: volume.formattedWithAbbreviations(),
            percentageChange: nil
        )
        
        return CoinDetailsSectionModel(
            title: "Overview",
            stats: [priceStats, marketCapStats, rankStats, volumeStats]
        )
    }
    
    var additionalDetailsSectionModel: CoinDetailsSectionModel {
        // 24H high
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStats = StatisticModel(
            title: "24H High",
            value: high,
            percentageChange: nil
        )
        
        // 24H low
        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStats = StatisticModel(
            title: "24H Low",
            value: low,
            percentageChange: nil
        )
        
        // 24H price change
        let priceChange = coin.priceChange24H.toCurrency()
        let priceChangePercentage = coin.priceChangePercentage24H
        let priceChangeStats = StatisticModel(
            title: "24H Price Change",
            value: priceChange,
            percentageChange: priceChangePercentage
        )
        
        // 24H Market Change
        let marketCap = coin.marketCapChange24H ?? 0
        let marketCapPercentageChange = coin.marketCapChangePercentage24H
        let marketCapStats = StatisticModel(
            title: "24H Market Cap Change",
            value: "$\(marketCap.formattedWithAbbreviations())",
            percentageChange: marketCapPercentageChange
        )
        
        return CoinDetailsSectionModel(
            title: "Additional Details",
            stats: [highStats, lowStats, priceChangeStats, marketCapStats]
        )
    }
    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()
        
        print("DEBUG: Coin is \(self.coinName)")
    }
    
    func configureChartData() {
        guard let prices = coin.sparklineIn7D?.price else { return }
        endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        var index = 0
        minPrice = prices.min()!
        maxPrice = prices.max()!
        yAxisValues = [minPrice, (minPrice + maxPrice) / 2 , maxPrice]
        xAxisValues = [startDate, endDate]
        for price in prices.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartDataItem = ChartData(date: date, price: price)
            chartData.append(chartDataItem)
            index += 1
        }
    }
}
