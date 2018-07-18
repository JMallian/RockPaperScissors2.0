//
//  ViewController.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/14/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {
    @IBOutlet weak var showHistoryButton: UIButton! //hide unless there's a history to show
    var history = ["player won", "player won", "player lost", "player won"]
    var playerWon: Bool?
    //todo: keep track of games for history list
    //find way to get out of table view once presented
    

    //MARK: storyboard actions
    @IBAction func rockButtonPressed(_ sender: Any) {
        let game = Game(playersThrow: .rock)
        prepareHistoryViewController(game: game)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        let game = Game(playersThrow: .paper)
        prepareHistoryViewController(game: game)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        let game = Game(playersThrow: .scissors)
        prepareHistoryViewController(game: game)
    }
    
    @IBAction func showHistoryButtonPressed(_ sender: Any) {
        let controller: HistoryViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        controller.history = self.history 
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: helper function
    func prepareHistoryViewController(game: Game) {
        let controller: MatchResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MatchResults") as! MatchResultsViewController
        controller.message = game.outcomeString
        controller.imageString = game.imageString
        present(controller, animated: true, completion: nil)
    }

}

