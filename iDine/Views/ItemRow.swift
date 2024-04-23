// iDine
// Copyright ©️ 2024 Iván Camilo Fuertes. All rights reserved.


import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    private let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
        
    var body: some View {
        HStack {
            thumbnailImage
            
            itemInfo
            
            Spacer()
            
            dietaryRestrictions
        }
    }
    
    private var thumbnailImage: some View {
        Image(item.thumbnailImage)
            .clipShape(Circle())
            .overlay(Circle().stroke(.gray, lineWidth: 2))
    }
    
    private var itemInfo: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
            Text("$\(item.price)")
        }
    }
    
    private var dietaryRestrictions: some View {
        ForEach(item.restrictions, id: \.self) { restriction in
            Text(restriction)
                .font(.caption)
                .fontWeight(.black)
                .padding(5.0)
                .background(colors[restriction])
                .clipShape(Circle())
                .foregroundStyle(.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ItemRow(item: MenuItem.example)
}
