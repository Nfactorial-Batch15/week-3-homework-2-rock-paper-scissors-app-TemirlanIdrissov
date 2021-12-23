//
//  Player.swift
//  RockPaperScissorsUI
//
//  Created by Temirlan Idrissov on 17.12.2021.
//

import Foundation

enum Choice {
    case rock
    case paper
    case scissors
}

class Player {
    var pick: Choice = .paper
    var score = 0
    
    func myChoice(choice: String) -> Choice {
       switch choice {
       case "rock":
           self.pick = Choice.rock
       case "paper":
           self.pick = Choice.paper
       case "scissors":
           self.pick = Choice.scissors
       default:
           print("wrong choice!")
       }
        
        print("You choiced ->", self.pick)
        return self.pick
   }
    
     func computerChoice() -> Choice {
        let randomChoice = Int.random(in: 1...3)
        if randomChoice == 1 {
            self.pick = .rock
        } else if randomChoice == 2{
            self.pick = .paper
        } else {
            self.pick = .scissors
        }
         print("Comp choiced ->", self.pick)
         return self.pick
    }
    
     static func play(myMove: Player, compPlayer: Player) -> String {
        var result = ""
        print(compPlayer.pick)
        print(myMove.pick)
        switch myMove.pick {
        case Choice.rock:
            if compPlayer.pick == Choice.rock {
                result = "Tie"
            }
            else if compPlayer.pick == Choice.paper {
                result = "Lose"
                compPlayer.score += 1
            }else {
                result = "Win!"
                myMove.score += 1
            }
        case .paper:
            if compPlayer.pick == Choice.rock {
                result = "Win!"
                myMove.score += 1
            }
            else if compPlayer.pick == .scissors {
                result = "Lose"
                compPlayer.score += 1
            }else {
                result = "Tie"
            }
        case .scissors:
            if compPlayer.pick == Choice.rock {
                result = "Lose!"
                compPlayer.score += 1
            }
            else if compPlayer.pick == .scissors {
                result = "Tie"
                
            }else {
                result = "Win!"
                myMove.score += 1
            }
        }
        return result
    }
   
}
