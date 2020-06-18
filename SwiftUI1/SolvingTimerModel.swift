//
//  SolvingTimerModel.swift
//  SwiftUI1
//
//  Created by Bader Alawadh on 6/16/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation

class SolvingTimer {
    var seconds = 0.0
    var minutes = 0
    var solvingTime = String()
    var solvingTimer = Timer()
    var isStarted = false
    
    
    // Start solving.
    func startSolvingTimer() {
        self.isStarted = true
        solvingTime = ""
        
        solvingTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(solvingTimerStarted), userInfo: nil, repeats: true)
    }
    
    @objc func solvingTimerStarted() {
        
        if self.minutes == 0 {
            
            self.seconds += 0.01
            self.solvingTime = String(format: "%0.2f", self.seconds)
            
            if self.seconds >= 60 {
                self.seconds = 0
                self.minutes += 1
                
            }
            print(self.solvingTime)
            
            
        }else {
            
            self.seconds += 0.01
            
            
            if self.seconds <= 10 {
                self.solvingTime = "\(self.minutes):0\(String(format: "%0.2f", self.seconds))"
                
            }else if self.seconds < 60 {
                self.solvingTime = "\(self.minutes):\(String(format: "%0.2f", self.seconds))"
                
            }else {
                self.seconds = 0
                self.minutes += 1
            }
            
            print(self.solvingTime)
        }
    }
    
    //Stop solving.
    func stopSolvingTimer() {
        solvingTimer.invalidate()
        self.seconds = 0
        self.minutes = 0
        isStarted = false
    }
    
}
