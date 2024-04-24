// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            image
            
            itemDescription
            
            addToCart
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var image: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text(item.photoCredit)
                .font(.caption)
                .foregroundStyle(Color.white)
                .padding(4.0)
                .background(.black)
                .offset(x: -5, y: -5)
        }
    }
        
    private var itemDescription: some View {
        Text(item.description)
            .padding()
    }
    
    private var addToCart: some View {
        Button("Add to Cart") {
            order.add(item: item)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    return ItemDetailTestView()
    
    struct ItemDetailTestView: View {
        @StateObject var order = Order()
        
        var body: some View {
            NavigationStack {
                ItemDetail(item: MenuItem.example)
                
                Text("Total items: \(order.items.count) Total Value: $\(order.total)")
            }.environmentObject(order)
        }
    }
}
