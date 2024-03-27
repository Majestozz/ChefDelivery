//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 27/03/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30){
                ForEach(storesMock){ mock in
                    StoreItemView(order: mock)
                }
            }
        }
        .padding(20)
    }
}

#Preview {
    StoresContainerView()
        .previewLayout(.sizeThatFits)
}
