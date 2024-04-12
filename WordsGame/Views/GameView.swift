//
//  GameView.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    print("Back")
                } label: {
                    Text("Выход")
                        .font(.custom("AvenirNext-Bold", size: 15))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal,10)
                }
                .background(Color("AppColor"))
                .cornerRadius(15)
                Spacer()
            }
            
            TitleText(text: "Магнитотерапия")
            
            HStack(spacing: 12) {
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
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .padding(.bottom, 10)
                    Text("Илья")
                        .font(.custom("AvenirNext-Bold", size: 24))
                }   .padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(12)
            }
            
            WordsTextField(word: $word, placeHolder: "Ваше слово:")
                .padding(.horizontal,20)
            
            Button {
                print("ready")
            } label: {
                Text("Готово")
                    .padding(12)
                    .foregroundColor(.black)
                    .font(.custom("AvenirNext-Bold", size: 15))
                    .padding(.vertical,7)
            }
            .frame(width: screen.width-40)
            .background(Color("AppColor"))
            .cornerRadius(12)
            
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color("BackGroundColor"))
    }
    

    
}

#Preview {
    GameView()
}
