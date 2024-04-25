// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "bookmark")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
        .environmentObject(Favorites())
}
