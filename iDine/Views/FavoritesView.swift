// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    private let title = "Favorites"
    
    private var hasFavorites: Bool {
        !favorites.items.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            if hasFavorites {
                favoritesList
            } else {
                noFavoritesView
            }
        }
    }
    
    private var favoritesList: some View {
        List {
            ForEach(favorites.items) { item in
                ItemRow(item: item)
            }
            .onDelete { indexSet in
                favorites.items.remove(atOffsets: indexSet)
            }
        }
        .navigationTitle(title)
        .toolbar {
            EditButton()
        }
    }
    
    private var noFavoritesView: some View {
        VStack(alignment: .center) {
            Text("0")
                .font(.permanentMarkerRegular(size: 90))
                .shadow(color: .gray, radius: 4)
            Text("Favorites")
                .font(.permanentMarkerRegular(size: 40))
                .shadow(color: .gray, radius: 4)
        }
        .navigationTitle(title)
    }
}

#Preview {
    FavoritesView().environmentObject(Favorites.demoFavorites)
}
