//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 27/03/24.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    CarouselItemView(order: OrderType(id: 1, name: "", image: "barbecue-banner"))
        .previewLayout(.sizeThatFits)
        .padding()
}
