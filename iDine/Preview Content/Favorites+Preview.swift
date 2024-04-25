// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import Foundation

extension Favorites {
    static var demoFavorites: Favorites {
        let favorites = Favorites()
        favorites.add(MenuItem.example)
        
        return favorites
    }
}
