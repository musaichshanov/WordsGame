
import Foundation

struct Player {
    
    let name: String
    private(set) var score = 0
    
    mutating func addScore(score:Int) {
        self.score += score
    }
    
}
