//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Alisson Inácio on 28/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity = 1
    var service = HomeService()
    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: productQuantity)
            Spacer()
            ProductDetailButtonView{
                Task{
                    await confirmOrder()
                }
                
            }
        }
    }
    
    func confirmOrder() async{
        do{
            let result = try await service.confirmOrder(product: product)
            switch result{
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }catch{
            print(error.localizedDescription)
        }
       
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button(action: {
            onButtonPress()
        }, label: {
            HStack{
                Image(systemName: "cart")
                
                Text("Enviar Pedido")
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y:8)
        })
    }
}
