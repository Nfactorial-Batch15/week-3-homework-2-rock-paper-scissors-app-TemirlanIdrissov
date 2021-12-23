//
//  Screen_2.swift
//  RockPaperScissorsUI
//
//  Created by Temirlan Idrissov on 16.12.2021.
//

import SwiftUI

struct Screen_2: View {
    @State var title = "Take your pick"
    @State var roundNumber = 1
    
    @State var player1 = Player()
    @State var player2 = Player()
    
    @State var isPaperChoosed = false
    @State var isRockChoosed = false
    @State var isScissorsChoosed = false
    
    @State var isShowingPaper = true
    @State var isShowingRock = true
    @State var isShowingScissors = true
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 12) {
            Text(title)
                .font(.system(size: 54, weight: .bold))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Round # \(roundNumber)")
            Text("Score \(player1.score) : \(player2.score)")
                .font(.system(size: 17, weight: .medium))
                .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
            VStack(alignment: .center, spacing: 16) {
                ChooseModeNavigationLInk(title: $title, player1: $player1, player2: $player2,isPaperChoosed: $isPaperChoosed, isRockChoosed: $isRockChoosed, isScissorsChoosed: $isScissorsChoosed, isShowingPaper: $isShowingPaper, isShowingRock: $isShowingRock, isShowingScissors: $isShowingScissors, roundNumber: $roundNumber)
            }
            .padding(.top, 50)
            
        }
        
        
    }
}

struct Screen_2_Previews: PreviewProvider {
    static var previews: some View {
        Screen_2()
    }
}

struct ChooseModeNavigationLInk: View {
    @Binding var title: String
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var isPaperChoosed: Bool
    @Binding var isRockChoosed: Bool
    @Binding var isScissorsChoosed: Bool
    @Binding var isShowingPaper: Bool
    @Binding var isShowingRock: Bool
    @Binding var isShowingScissors: Bool
    @Binding var roundNumber: Int
    var body: some View {
        if isShowingPaper {
            choosePaper
            if !isShowingRock {
                Spacer()
                NavigationLink(destination: Screen_2()) {
                    chooseChange
                }
                NavigationLink(destination: Screen_3(player1: $player1, player2: $player2, roundNumber: $roundNumber)) {
                    chooseContinue
                }
            }

        }
        if isShowingScissors {
            chooseScissors
            if !isShowingRock {
                Spacer()
                NavigationLink(destination: Screen_2()) {
                    chooseChange
                }
                NavigationLink(destination: Screen_3(player1: $player1, player2: $player2, roundNumber: $roundNumber)) {
                    chooseContinue
                }
            }

        }
        if isShowingRock {
            chooseRock
            if !isShowingPaper {
                Spacer()
                NavigationLink(destination: Screen_2()) {
                    chooseChange
                }
                NavigationLink(destination: Screen_3(player1: $player1, player2: $player2, roundNumber: $roundNumber)) {
                    chooseContinue
                }
            }

        }
            
    }
    
    var choosePaper: some View {
        Button {
            withAnimation{
                
                title = "Your pick"
                isShowingScissors = false
                isShowingRock = false
                player1.pick = player1.myChoice(choice: "paper")
                
            }
//            isPaperChoosed.toggle()
            
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                Text("🧻")
                    .font(.system(size: 80))
                
            }
            .frame(height: 128)
            .padding([.leading, .trailing])
            
        }
    }
    
    var chooseRock: some View {
        Button {
            withAnimation(.default, {
                
                title = "Your pick"
            })
            isRockChoosed.toggle()
            isShowingScissors.toggle()
            isShowingPaper.toggle()
            player1.pick = player1.myChoice(choice: "rock")
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                Text("🗿")
                    .font(.system(size: 80))
                
            }
            .frame(height: 128)
            .padding([.leading, .trailing])
            
        }
    }
    
    var chooseScissors: some View {
        Button {
            withAnimation(.default, {
                
                title = "Your pick"
            })
            isScissorsChoosed.toggle()
            isShowingPaper.toggle()
            isShowingRock.toggle()
            player1.pick = player1.myChoice(choice: "scissors")
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color(red: 243/255, green: 242/255, blue: 248/255))
                Text("✂️")
                    .font(.system(size: 80))
                
            }
            .frame(height: 128)
            .padding([.leading, .trailing])
            
        }
    }
    
    var chooseChange: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 103/255, green: 80/255, blue: 164/255))
            Text("I changed my mind")
                .foregroundColor(Color.white)
        }
        .padding([.leading, .trailing])
        .frame(height: 50)
    }
    
    var chooseContinue: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 103/255, green: 80/255, blue: 164/255))
            Text("Continue")
                .foregroundColor(Color.white)
        }
        .padding([.leading, .trailing])
        .frame(height: 50)
    }
}


