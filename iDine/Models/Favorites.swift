// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import Foundation

final class Favorites: ObservableObject {
    @Published var items: [MenuItem] = []
    
    func add(_ item: MenuItem) {
        items.append(item)
    }
    
    func remove(_ item: MenuItem) {
        items.removeAll(where: { $0.id == item.id })
    }
    
    func isFavorite(_ item: MenuItem) -> Bool {
        items.contains(item)
    }
}
