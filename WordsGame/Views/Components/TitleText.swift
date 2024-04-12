//
//  TitleText.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct TitleText: View {
    
    @State var text = ""
    var body: some View {
        Text(text)
        
            .padding()
            .font(.custom("AvenirNext-Bold", size: 42))
            .background(Color("AppColor"))
            .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}

#Preview {
    TitleText(text: "Магнитотерапия")
}
