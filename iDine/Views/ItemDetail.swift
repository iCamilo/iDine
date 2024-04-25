// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    let item: MenuItem
            
    var body: some View {
        VStack {
            image
            
            itemDescription
            
            addToCart
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                favoriteToggle
            }
        }
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
        .padding()
        .frame(maxWidth: .infinity)
        .font(.permanentMarkerRegular(size: 20))
        .foregroundColor(.white)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20, 
                                    style: .continuous))
        .shadow(color: .gray , radius: 5, x: 2, y: 2)
    }
    
    private var favoriteToggle: some View {
        let isFavorite: Bool = favorites.isFavorite(item)
        let isFavoriteImageName: String = isFavorite ? "bookmark.fill" : "bookmark"
        
        return Button("Favorite", systemImage: isFavoriteImageName) {
            isFavorite ? favorites.remove(item) : favorites.add(item)
        }
    }
}

#Preview {
    return ItemDetailTestView()
    
    struct ItemDetailTestView: View {
        @StateObject var order = Order()
        @StateObject var favorites = Favorites()
        
        var body: some View {
            NavigationStack {
                ItemDetail(item: MenuItem.example)
                
                Text("Order: \(order.items.count) items for $\(order.total)")
                Text("Favorites: \(favorites.items.count) items")
            }
            .environmentObject(order)
            .environmentObject(favorites)
        }
    }
}
