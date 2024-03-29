//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 28/03/24.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                StoreDetailHeaderView(store: store)
                StoreDetailProductsView(products: store.products)
                
            }
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "cart")
                        Text("Lojas")
                    }
                    .foregroundColor(Color("ColorRed"))
                }
            }
        }
    }
}


#Preview {
    StoreDetailView(store: storesMock[0])
}
