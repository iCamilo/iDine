// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        Text(item.name)
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}
