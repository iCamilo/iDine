// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
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
            
            Text(item.description)
                .padding()
            
            Button("Add to Cart") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
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
