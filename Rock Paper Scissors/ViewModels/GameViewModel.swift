//
//  GameViewModel.swift
//  Rock Paper Scissors
//
//  Created by Thanh Tra Le on 04/12/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var content = ["rock", "paper", "scissors"]
    @Published var showAlert = false
    @Published var computerSelected = 0
    @Published var playerSelected = 0
    @Published var computerScore = 0
    @Published var playerScore = 0
    @Published var playTime: Float = 0
    @Published var pleaseChosse = true
    @Published var computerWin = false
    @Published var computerLose = false
    @Published var equal = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    func playerChossed() {
        winChecker()
        checkResult()
        pleaseChosse = false
        showAlert = true
        if playTime < 10 {
            playTime += 1
        } else {
            resetScore()
        }
    }
    
    func winChecker() {
        let checkResul = "\(computerSelected)-\(playerSelected)"
        switch checkResul {
            
        case "0-0":  equal = true; computerWin = false; computerLose = false
        case "0-1":  equal = false; computerWin = false; computerLose = true
        case "0-2":  equal = false; computerWin = true; computerLose = false
            
        case "1-0":  equal = false; computerWin = true; computerLose = false
        case "1-1":  equal = true; computerWin = false; computerLose = false
        case "1-2":  equal = false; computerWin = false; computerLose = true
            
        case "2-0":  equal = false; computerWin = false; computerLose = true
        case "2-1":  equal = false; computerWin = true; computerLose = false
        case "2-2":  equal = true; computerWin = false; computerLose = false
            
        default: equal = false; computerWin = false; computerLose = false
        }
    }
    
    func checkResult() {
        if equal == true && computerWin == false && computerLose == false {
            alertTitle = "Draw"
            alertMessage = "Keep going"
        } else if equal == false && computerWin == false && computerLose == true {
            alertTitle = "You win"
            alertMessage = "Congratulations"
            if computerScore > 0 {
                computerScore -= 1
            }
            if playerScore < 10 {
                playerScore += 1
            }
        } else if equal == false && computerWin == true && computerLose == false {
            alertTitle = "You lose"
            alertMessage = "Try again"
            if playerScore > 0 {
                playerScore -= 1
            }
            if computerScore < 10 {
                computerScore += 1
            }
        }
    }
    
    func resetResuil() {
        showAlert = false
        computerSelected = 0
        playerSelected = 0
        pleaseChosse = true
        computerWin = false
        computerLose = false
        equal = false
    }
    
    func resetScore() {
        playerScore = 0
        computerScore = 0
        resetResuil()
        playTime = 0
    }
}
