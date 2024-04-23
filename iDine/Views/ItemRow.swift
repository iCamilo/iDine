// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ItemRow(item: MenuItem.example)
}
