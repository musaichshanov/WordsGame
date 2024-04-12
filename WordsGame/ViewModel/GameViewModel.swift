
import Foundation

enum WordError: Error {
    case theSameWord
    case beforeWord // слово было ранее
    case littleWord // <2 букв
    case wrongWord // не может быть составлено
    case unexpectedError
}
class GameViewModel: ObservableObject {
    
    @Published var playerOne: Player
    @Published var playerTwo: Player
    @Published var words = [String]()
    
    let word: String
    var isFirst = true
    
    init(playerOne: Player, playerTwo: Player, word: String) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        self.word = word.uppercased()
    }
    
    func isValidate(word: String) throws {
        
        let word = word.uppercased()
        guard word != self.word else {
            throw WordError.theSameWord
        }
        guard !(words.contains(word)) else {
            throw WordError.beforeWord
        }
        
        guard word.count > 1 else {
            throw WordError.littleWord
        }
        
        return
    }
    
    func wordToChars(word:String) -> [Character] {
        
        var chars=[Character]()
        
        for char in word.uppercased() {
            chars.append(char)
        }
        
        return chars
    }
    
    func checkWord(word:String) throws -> Int {
        
        do {
            try self.isValidate(word: word)
        }
        catch {
            throw error
        }
        
        
        var bigWordArray = wordToChars(word: self.word)
        let smallWordArray = wordToChars(word: word)
        var result = ""
        for char in smallWordArray {
            if bigWordArray.contains(char) {
                result.append(char)
                var i = 0
                while(bigWordArray[i] != char) {
                    i += 1
                }
                bigWordArray.remove(at: i)
                
            }
            else {
                throw WordError.wrongWord
            }
        }
        guard result == word.uppercased() else {
            print("Ошибка")
            return 0
        }
        words.append(result)
        if isFirst {
            playerOne.addScore(score: result.count)
        }
        else {
            playerTwo.addScore(score: result.count)
        }
        
        isFirst.toggle()
        
        return result.count
    }
}
