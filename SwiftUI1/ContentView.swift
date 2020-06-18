//
//  ContentView.swift
//  SwiftUI1
//
//  Created by Bader Alawadh on 6/13/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var scrambleText = String()
    @State var solvingTimer = SolvingTimer()
    
    
    var body: some View {
        ZStack{
            //Background.
            Color.black
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            
            
            //Start Button.
            Button(action: {
            
                if !self.solvingTimer.isStarted {
                    self.solvingTimer.startSolvingTimer()
                    
                }else {
                    self.solvingTimer.stopSolvingTimer()
                    self.scramble()
                    
                }
                
                
            }) {
                
                if self.solvingTimer.solvingTime == "" {
                    startButtonText(text: "Start")
                    
                }else {
                    startButtonText(text: self.solvingTimer.solvingTime)
                    
                }
                
            }
            
            //Scramble text.
            VStack{

                Text(self.scrambleText)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .lineLimit(3)
                    .padding([.top], 30)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 25, weight: .regular, design: .default))
                Spacer()
            }
        }
        .onAppear(perform: self.scramble)
        
    }
    
    //Generating scramble.
    func scramble(){
        self.scrambleText = ""
        
        let cubeMoves = ["R", "R'", "L", "L'", "U", "U'", "D", "D'", "U", "U'", "F", "F'", "F2", "D2", "R2", "L2", "B2", "U2"]
        var randomSymbol = cubeMoves.randomElement()
        var previousSymbol = ""
        let randomNumber = Int.random(in: 18 ... 25)
        
        for _ in 1 ... randomNumber {
            
            while randomSymbol?.first == previousSymbol.first {
                randomSymbol = cubeMoves.randomElement()
                
            }
            
            self.scrambleText += randomSymbol! + " "
            previousSymbol = randomSymbol!
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct startButtonText: View {
    var text: String
    
    var body: some View {
        Text(self.text)
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}
