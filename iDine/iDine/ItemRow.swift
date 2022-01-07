//
//  ItemRow.swift
//  iDine
//
//  Created by Ana Leticia Camargos on 25/10/21.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    
    var body: some View {
        HStack {
            Image(item.thumbnailImage).clipShape(Circle()) .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack {
                
                HStack {
                    Text(item.name).font(.headline)
                    Spacer()
                }
                HStack {
                    Text(String("$\(item.price)"))
                    Spacer()
                }
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction).font(.caption).fontWeight(.black).padding(5).background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }.padding()
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: .example)
    }
}
