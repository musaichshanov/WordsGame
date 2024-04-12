//
//  GameView.swift
//  WordsGame
//
//  Created by Муса Ищанов on 12.04.2024.
//

import SwiftUI

struct GameView: View {
    
    @State private var word = ""
    @Environment(\.dismiss) var dismiss
    @State private var confirmPresent = false
    @State private var alertPresent = false
    @State var alertText = ""
    var viewModel:GameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button {
                    confirmPresent.toggle()
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
            
            TitleText(text: self.viewModel.word)
            
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.playerOne.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .padding(.bottom, 10)
                        
                    Text(viewModel.playerOne.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                }   .padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(12)
                    .shadow(color: viewModel.isFirst ? .red : .clear, radius:10)
                
                VStack {
                    Text("\(viewModel.playerTwo.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .padding(.bottom, 10)
                    Text(viewModel.playerTwo.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                }   .padding(20)
                    .frame(width: screen.width/2.2, height: screen.width/2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(12)
                    .shadow(color: viewModel.isFirst ? .clear : .blue, radius:10)
            }
            
            WordsTextField(word: $word, placeHolder: "Ваше слово:")
                .padding(.horizontal,20)
            
            Button {
                var score = 0
                
                do {
                    try score = viewModel.checkWord(word: word)
                }
                catch WordError.beforeWord {
                    alertText = "Слово повторяется с угаданными"
                    alertPresent.toggle()
                }
                catch WordError.littleWord {
                    alertText = "Слишком короткое слово"
                    alertPresent.toggle()
                }
                catch WordError.theSameWord {
                    alertText = "Слово повторяется с заданным"
                    alertPresent.toggle()
                }
                catch WordError.wrongWord {
                    alertText = "Такое слово не может быть составлено"
                    alertPresent.toggle()
                }
                catch {
                    alertText = "Неизвестная ошибка"
                    alertPresent.toggle()
                }
                if (score > 1) {
                    self.word = ""
                }
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
                ForEach(0 ..< self.viewModel.words.count, id: \.description) { item in
                    WordCell(word: viewModel.words[item])
                        .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                        .listRowInsets(EdgeInsets())
                }
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color("BackGroundColor"))
        .confirmationDialog("Вы уверены что хотите выйти?", isPresented: $confirmPresent, titleVisibility: .visible) {
            
            Button(role: .destructive) {
                self.dismiss()
            } label: {
                Text("Да")
            }
            Button(role: .cancel) {}
            label: {
                Text("Нет")
            }
            
            }
        .alert(alertText,
               isPresented: $alertPresent) {
               Text("OK")
        }
    }
    

    
}

#Preview {
    GameView(viewModel: GameViewModel(playerOne: Player(name: "Вася"), playerTwo: Player(name: "Федя"), word: "Рекомпозиция"))
}
