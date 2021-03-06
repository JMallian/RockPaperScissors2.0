//
//  Game.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/17/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import Foundation

class Game {
    enum GamePlay: Int {
        case rock
        case paper
        case scissors
    }
    enum Winner: String {
        case player
        case computer
        case tie
    }
    
    let playersThrow: GamePlay
    var computersThrow = GamePlay(rawValue: Int(arc4random_uniform(3)))

    var playerWon: Winner {
        get {
            print("player won created")
            return getWinner()
        }
    }
    var outcomeString: String {
        get {
            return getOutcomeString()
        }
    }
    var imageString: String {
        get {
            return getImageString()
        }
    }
    
    init(playersThrow: GamePlay) {
        self.playersThrow = playersThrow
    }
    
    func getOutcomeString() -> String {
        if self.playersThrow == self.computersThrow {
            return "tie game"
        }
        
        switch self.playersThrow{
        case .paper:
            return self.computersThrow == .scissors ? "Computer cuts your paper with scissors." : "You cover computer's rock."
        case .rock:
            return self.computersThrow == .paper ? "Computer covers your rock with paper." : "You crush your computer's scissors"
        case .scissors:
            return self.computersThrow == .rock ? "Computer crushes your scissors with rock." : "You cut computer's paper"
        }
    }
    
    func getWinner() -> Winner {
        if self.playersThrow == self.computersThrow {
            return .tie
        }
        
        switch self.playersThrow{
        case .paper:
            return self.computersThrow == .scissors ? .computer : .player
        case .rock:
            return self.computersThrow == .paper ? .computer : .player
        case .scissors:
            return self.computersThrow == .rock ? .computer : .player
        }
    }
    
    func getImageString() -> String {
        if playersThrow == computersThrow {
            return "itsATie"
        }
        
        switch playersThrow {
        case .paper:
            return computersThrow == .scissors ? "ScissorsCutPaper" : "PaperCoversRock"
        case .rock:
            return computersThrow == .paper ? "PaperCoversRock" : "RockCrushesScissors"
        case .scissors:
            return computersThrow == .rock ? "RockCrushesScissors" : "ScissorsCutPaper"
        }
    }
    
    func getComputersThrow() -> GamePlay {
        let randomNumber = arc4random_uniform(3)
        return GamePlay(rawValue: Int(randomNumber))! //I know it will exist

    }
}
