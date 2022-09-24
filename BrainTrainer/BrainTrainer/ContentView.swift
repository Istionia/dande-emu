//
//  ContentView.swift
//  BrainTrainer
//
//  Created by Timothy on 17/09/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var currentMove = Int.random(in: 0...2)
    
    let outcomes = ["Win", "Lose"]
    @State private var desiredOutcome = Bool.random()
    
    @State private var currentChoice = "Rock"
    @State private var playerScore = 0
    
    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors - or is it?")
                .font(.largeTitle.bold())
                .foregroundColor(.indigo)
            
            Spacer()
            
            VStack {
                Text("Gamemaster's move is")
                    .font(.subheadline.weight(.heavy))
                    .foregroundStyle(.secondary)
                
                Text(moves[currentMove])
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("Gamemaster wants you to")
                    .font(.subheadline.weight(.heavy))
                    .foregroundStyle(.secondary)
                
                Text(outcomes[_desiredOutcome])
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.black)
                
                Spacer()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
