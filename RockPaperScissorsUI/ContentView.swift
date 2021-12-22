//
//  ContentView.swift
//  RockPaperScissorsUI
//
//  Created by Temirlan Idrissov on 16.12.2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
               backgroundImage
                VStack {
                    titleText
                        .font(.system(size: 54, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                    
                    NavigationLink(destination: Screen_2()){
                            chooseGameMode(modeGame: "Single")
                                .padding(.bottom)
                    }
                    .foregroundColor(Color(red: 103/255, green: 80/255, blue: 164/255))
                }
                .navigationBarTitleDisplayMode(.inline)
//                .navigationTitle("Welcome to the game")
            }
            
            
        }
    }
    
    var titleText: some View {
        Text("Welcome to the game")
    }
    
    var backgroundImage: some View {
        Image("BackgroundImage")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct chooseGameMode: View {
    var modeGame: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
            Text("\(modeGame) Player")
                .foregroundColor(Color.white)
        }
        .padding([.leading, .trailing])
        .frame(height: 50)
    }
}
