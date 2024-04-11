//
//  WordsTextField.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeHolder: String
    var body: some View {
        TextField(placeHolder, text: word)
            .padding()
            .font(.title2)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

