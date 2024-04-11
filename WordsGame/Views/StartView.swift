//
//  ContentView.swift
//  WordsGame
//
//  Created by Муса Ищанов on 11.04.2024.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord: String = ""
    @State var playerOne: String = ""
    @State var playerTwo: String = ""
    
    @State var isShowedGame = false
    
    var body: some View {
        VStack {
            Spacer()
            TitleText(text: "Words Game")
            
            WordsTextField(word: $bigWord, placeHolder: "Введите большое слово")
                .padding(20)
                .padding(.top,32)
            
            HStack {
                WordsTextField(word: $playerOne, placeHolder: "Игрок 1")
                    .padding(.horizontal, 20)
                
                WordsTextField(word: $playerTwo, placeHolder: "Игрок 2")
                    .padding(.horizontal, 20)
            }
            .padding(.bottom,30)
            
            
            Button {
                isShowedGame.toggle()
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.black)
                    .padding()
                    .padding(.horizontal,40)
            }
            .background(Color("AppColor"))
            .cornerRadius(15)
            Spacer()
        }
        .fullScreenCover(isPresented: $isShowedGame,  content: {
            GameView()
        })
        .background(Color("BackGroundColor"))
    }
}

#Preview {
    StartView()
}
