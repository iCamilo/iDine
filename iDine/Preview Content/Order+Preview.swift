// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import Foundation

extension Order {
    static var demoOrder: Order {
        let order = Order()
        order.add(item: MenuItem.example)
        
        return order
    }
}
