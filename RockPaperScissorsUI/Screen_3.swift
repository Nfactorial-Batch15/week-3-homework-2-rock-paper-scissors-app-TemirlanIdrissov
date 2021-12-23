//
//  Screen_3.swift
//  RockPaperScissorsUI
//
//  Created by Temirlan Idrissov on 16.12.2021.
//

import SwiftUI

struct Screen_3: View {
    @State var title = "Your \nopponent is \nthinking"
    @State var animate = false
    @Binding var player1: Player
    @Binding var player2: Player
    @State var isLoading = false
    @State var computerPick = false
    @State var seconds = 1
    @Binding var roundNumber: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack{
            if !computerPick {
            VStack {
                if isLoading{
                    Text("Your \nopponent is \nthinking")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 54, weight: .bold))
                        .padding(.top, 92)
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.gray).opacity(0.2)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(3)
                            .padding()
                    }
                    .frame(height: 148)
                }else {
                    Text("Your opponent’s pick")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 54, weight: .bold))
                        .padding(.top, 92)
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.gray).opacity(0.2)
                        choicedCompMove(player2: $player2, title: $title)
                    }
                    .frame(height: 148)
                    
                }
                Spacer()
            }
            .padding([.leading, .trailing])
            
            }else{
                ShowResult(roundNumber: $roundNumber, player1: $player1, player2: $player2)
                   
            }
        }
        .onAppear {
            startFakeLoading()
            roundNumber += 1
            
        }
        .onReceive(timer){ _ in
            if(seconds < 6){
                self.seconds = self.seconds + 1
            }
            else if(seconds == 6) {
                computerPick = true
                self.seconds = 1
            }
        }
        
    }
    
    
    
    func startFakeLoading(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isLoading = false
            player2.pick = player2.computerChoice()
            
        }
    }
}

struct Screen_3_Previews: PreviewProvider {
    static var previews: some View {
        Screen_3(player1: .constant(Player()), player2: .constant(Player()), roundNumber: .constant(1) )
    }
}



struct choicedCompMove: View {
    @Binding var player2: Player
    @Binding var title: String
    var body: some View {
        if player2.pick == .paper {
            Text("🧻")
                .font(.system(size: 80))
        }else if player2.pick == .rock {
            Text("🗿")
                .font(.system(size: 80))
        }else {
            Text("✂️")
                .font(.system(size: 80))
        }
    }
}

