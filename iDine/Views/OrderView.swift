// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        List {
            Section {
                orderItems
            }
            
            Section {
                checkOut
            }
        }
        .navigationTitle("Order")
    }
    
    private var orderItems: some View {
        ForEach(order.items) { item in
            HStack {
                Text(item.name)
                Spacer()
                Text("$\(item.price)")
            }
        }
    }
    
    private var checkOut: some View {
        NavigationLink("Check Out") {
            Text("Check Out")
        }
    }
}

#Preview {
    
    return OrderViewTestView()
    
    struct OrderViewTestView: View {
        @StateObject var order = Order()
        
        var body: some View {
            VStack {
                NavigationStack {
                    OrderView()
                }
                
                Button("Add Item") {
                    order.add(item: MenuItem.example)
                }
                .buttonStyle(.borderedProminent)
            }
            .environmentObject(order)
        }
    }
}
