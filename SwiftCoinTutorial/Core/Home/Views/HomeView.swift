//
//  HomeView.swift
//  SwiftCoinTutorial
//
//  Created by Dexter Kim on 6/17/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // top movers view
                    TopMoversView(viewModel: viewModel)
                    
                    Divider()
                    
                    // all coins view
                    AllCoinsView(viewModel: viewModel)
                }
                .navigationTitle("Live Prices")
                
                if viewModel.isLoadingIndicator {
                    CustomLoadingIndicator()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
