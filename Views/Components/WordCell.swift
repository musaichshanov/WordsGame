//
//  WordCell.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct WordCell: View {
    let word: String
    
    var body: some View {
        
        HStack{
            Text(word)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
                .font(.custom("AvenirNext-bold", size: 22))
            Text("\(word.count)")
                .padding()
                .font(.custom("AvenirNext-bold", size: 22))
        }
    }
}

#Preview {
    WordCell(word: "Магнит")
}
