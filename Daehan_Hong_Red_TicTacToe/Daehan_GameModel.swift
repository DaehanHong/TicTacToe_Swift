//
//  Daehan_GameModel.swift
//  Daehan_Hong_Red_TicTacToe
//
//  Created by Daehan Hong on 2019-10-09.
//  Copyright © 2019 Daehan Hong. All rights reserved.
//

import Foundation

class Daehan_GameModel{
    var whoseTurn = "X"
    var numberOfMovesPlayed = 0
    var lastPlayed = ""
    var whoWon = ""
    
    var isPastGame = false
    
    var squareContents = Array(repeating: "", count: 10)
    
    var orderOfMoves = [Int]()
    
    let winningCombinations = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
    ]
    
    func playMove(tag: Int) {
        orderOfMoves.append(tag)
        squareContents[tag] = whoseTurn
        lastPlayed = whoseTurn
        
        if(whoseTurn == "X") {
            whoseTurn = "O"
        } else {
            whoseTurn = "X"
        }
        
        numberOfMovesPlayed += 1
    }
    
    func isGameFinished() -> Bool {
        if(numberOfMovesPlayed < 5) {
            return false
        }
        
        // check if somebody has won.
        
        for winningCombo in winningCombinations {
            let index1 = winningCombo[0]
            let index2 = winningCombo[1]
            let index3 = winningCombo[2]
            
            if(squareContents[index1] == lastPlayed
            && squareContents[index2] == lastPlayed
                && squareContents[index3] == lastPlayed) {
                //game over, won by lastPlayed
                whoWon = lastPlayed
                saveGame()
                return true
            }
            
        }
        
        if(numberOfMovesPlayed == 9) {
            saveGame()
            return true
        }
        
        return false
    }
    
    func saveGame() {
        
        // if past game replay, don't save
        if(isPastGame) {
            return
        }
        
        let numGamesPlayed = UserDefaults.standard.integer(forKey: Constants.NUM_GAMES)
        
        let gameNumber = numGamesPlayed + 1
        
        UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON + String(gameNumber))
        
        UserDefaults.standard.set(Date(), forKey: Constants.DATE_TIME + String(gameNumber))
        
        UserDefaults.standard.set(orderOfMoves, forKey: Constants.ORDER_OF_MOVES + String(gameNumber))
        
        UserDefaults.standard.set(gameNumber, forKey: Constants.NUM_GAMES)
        
        print("game saved")
    }
}

struct Constants {
    static let NUM_GAMES = "numberOfGamesPlayed"
    static let WHO_WON = "whoWon"
    static let DATE_TIME = "dateTime"
    static let ORDER_OF_MOVES = "orderOfMoves"
}
