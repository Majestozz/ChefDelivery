//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                NavigationBar()
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
