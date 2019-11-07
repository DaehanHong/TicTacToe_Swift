//
//  Daehan_GameViewController.swift
//  Daehan_Hong_Red_TicTacToe
//
//  Created by Daehan Hong on 2019-10-09.
//  Copyright © 2019 Daehan Hong. All rights reserved.
//

import UIKit

class Daehan_GameViewController: UIViewController {

    //MARK:- Class variables
    var theGameModel = Daehan_GameModel()
    var gameFinished = false
    var pastGameData : GameData?
    var replayingPastGame = false
        
    //MARK:- Class variables
    
    @IBOutlet weak var gameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(replayingPastGame) {
            theGameModel.isPastGame = true
            // add some comment
            //play the moves from the past game
            let pastGameMoves = pastGameData?.orderOfMoves
            
            for move in pastGameMoves! {
                let button = view.viewWithTag(move)
                squareTouched(button as! UIButton)
            }
            
        } else {
            //do nothing else
        }
    }
    
    //MARK:- IBAction
    
    @IBAction func squareTouched(_ sender: UIButton) {
        
        print("button touched")
        print(sender.tag)
        
        if(sender.currentTitle == "X" || sender.currentTitle == "O" || gameFinished){
            return
        }
        
        sender.setTitle(theGameModel.whoseTurn, for: .normal)
        theGameModel.playMove(tag: sender.tag)
        
        if(theGameModel.isGameFinished()) {
            let winner = theGameModel.whoWon
            
            if(winner.count > 0) {
                gameStateLabel.text = winner + " Won!"
            } else {
                gameStateLabel.text = "Draw!"
            }
            
            gameFinished = true
        }else {
            gameStateLabel.text = theGameModel.whoseTurn + "'s Turn"
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
