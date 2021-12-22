//
//  ShowResult.swift
//  RockPaperScissorsUI
//
//  Created by Temirlan Idrissov on 20.12.2021.
//

import SwiftUI

struct ShowResult: View {
    @Binding var roundNumber: Int
    @Binding var player1: Player
    @Binding var player2: Player
    var body: some View {
        VStack {
            showResultTitle(player1: $player1, player2: $player2)
            Text("Score \(player1.score) : \(player2.score)")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
            Spacer()
            ZStack {
                showMyChoice(player1: $player1)
                showCompChoice(player2: $player2)
            }
            Spacer()
            NavigationLink(destination: Screen_2(roundNumber: roundNumber, player1: player1, player2: player2)){
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(red: 103/255, green: 80/255, blue: 164/255))
                    Text("Another round")
                        .foregroundColor(Color.white)
                }
                
                .padding([.leading, .trailing])
                .frame(height: 50)
                
            }
        }
        
    }
}

struct ShowResult_Previews: PreviewProvider {
    static var previews: some View {
        ShowResult(roundNumber: .constant(1), player1: .constant(Player()), player2: .constant(Player()))
    }
}

struct showMyChoice: View {
    @Binding var player1: Player
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color(red: 243/255, green: 242/255, blue: 248/255))
            if player1.pick == .rock {
                Text("🗿")
                    .font(.system(size: 80))
            }else if player1.pick == .paper {
                Text("🧻")
                    .font(.system(size: 80))
            }else {
                Text("✂️")
                    .font(.system(size: 80))
            }
        }
        .frame(width: 198, height: 128)
        .padding(.trailing, 150)
        .padding(.bottom, 150)
    }
}

struct showCompChoice: View {
    @Binding var player2: Player
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color(red: 243/255, green: 242/255, blue: 248/255))
            Capsule()
                .stroke(Color.white, lineWidth: 12)
            if player2.pick == .rock {
                Text("🗿")
                    .font(.system(size: 80))
            }else if player2.pick == .paper {
                Text("🧻")
                    .font(.system(size: 80))
            }else {
                Text("✂️")
                    .font(.system(size: 80))
            }
            
        }
        
        .frame(width: 198, height: 128)
        .padding(.leading, 150)
    }
}

struct showResultTitle: View {
    @Binding var player1: Player
    @Binding var player2: Player
    
    var body: some View {
        if player1.pick == .rock && player2.pick == .rock || player1.pick == .paper && player2.pick == .paper || player1.pick == .scissors && player2.pick == .scissors {
            Text("\(Player.play(myMove: player1, compPlayer: player2))")
                .font(.system(size: 54, weight: .bold))
                .foregroundColor(.yellow)
        }
        else if player1.pick == .rock && player2.pick == .scissors || player1.pick == .paper && player2.pick == .rock || player1.pick == .scissors && player2.pick == .paper {
            Text("\(Player.play(myMove: player1, compPlayer: player2))")
                .font(.system(size: 54, weight: .bold))
                .foregroundColor(.green)
        }else {
            Text("\(Player.play(myMove: player1, compPlayer: player2))")
                .font(.system(size: 54, weight: .bold))
                .foregroundColor(.red)
        }
    }
}
