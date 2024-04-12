//
//  PlayerCell.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct PlayerCell: View {
    
    var body: some View {
        VStack {
            Text("0")
                .font(.custom("AvenirNext-Bold", size: 60))
                .padding(.bottom, 10)
                
            Text("Вася")
                .font(.custom("AvenirNext-Bold", size: 24))
        }   .padding(20)
            .frame(width: screen.width/2.2, height: screen.width/2.2)
            .background(Color("FirstPlayer"))
            .cornerRadius(12)
    }
}

#Preview {
    PlayerCell()
}
