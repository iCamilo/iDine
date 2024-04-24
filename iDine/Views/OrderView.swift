// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    orderItems
                }
                
                Section {
                    checkOut
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private var orderItems: some View {
        ForEach(order.items) { item in
            HStack {
                Text(item.name)
                Spacer()
                Text("$\(item.price)")
            }
        }
        .onDelete(perform: { indexSet in
            order.items.remove(atOffsets: indexSet)
        })
    }
    
    private var checkOut: some View {
        NavigationLink("Check Out") {
            CheckOutView()
        }
    }
}

#Preview {
    
    return OrderViewTestView()
    
    struct OrderViewTestView: View {
        @StateObject var order = Order()
        
        var body: some View {
            VStack {
                OrderView()
                
                VStack {
                    Button("Add Item") {
                        order.add(item: MenuItem.example)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Text("Order has \(order.items.count) items")
                }
            }
            .environmentObject(order)
        }
    }
}
