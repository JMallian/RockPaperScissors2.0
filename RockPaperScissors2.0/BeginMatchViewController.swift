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
    
//    enum GamePlay: Int {
//        case rock
//        case paper
//        case scissors
//    }
    
    //these will be used to set properties of MatchResultsViewController when instantiated
    var outcomeMessage = ""
    var imageString = ""

    //MARK: lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    //MARK: storyboard actions
    @IBAction func rockButtonPressed(_ sender: Any) {
        let game = Game(playersThrow: .rock)
        let controller: MatchResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MatchResults") as! MatchResultsViewController
        controller.message = game.outcomeString
        controller.imageString = game.imageString
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        let game = Game(playersThrow: .paper)
        let controller: MatchResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MatchResults") as! MatchResultsViewController
        controller.message = game.outcomeString
        controller.imageString = game.imageString
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        // Udacity requirement: All code: Instantiate the results view controller using the storyboard, and set the text of its label property. Connect the action on the rock button.
        let game = Game(playersThrow: .scissors)
        let controller: MatchResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MatchResults") as! MatchResultsViewController
        controller.message = game.outcomeString
        controller.imageString = game.imageString
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func showHistoryButtonPressed(_ sender: Any) {
        let controller: HistoryViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        controller.history = self.history 
        present(controller, animated: true, completion: nil)
    }
    
    //MARK: misc functions 
//    func generateOpponentsPlay() -> GamePlay {
//        let randomNumber = arc4random_uniform(3)
//        print("computer plays \(GamePlay(rawValue: Int(randomNumber))!)")
//        return GamePlay(rawValue: Int(randomNumber))! //I know it will exist
//    }
    
//    func determineWinner(playersThrow: GamePlay, opponentsThrow: GamePlay) -> String {
//        if playersThrow == opponentsThrow {
//            return "tie game"
//        }
//        
//        switch playersThrow {
//        case .paper:
//            return opponentsThrow == .scissors ? "Computer cuts your paper with scissors." : "You cover computer's rock."
//        case .rock:
//            return opponentsThrow == .paper ? "Computer covers your rock with paper." : "You crush your computer's scissors"
//        case .scissors:
//            return opponentsThrow == .rock ? "Computer crushes your scissors with rock." : "You cut computer's paper"
//        }
//    }
    
//    func determineImageString(playersThrow: GamePlay, opponentsThrow: GamePlay) -> String {
//        if playersThrow == opponentsThrow {
//            return "itsATie"
//        }
//
//        switch playersThrow {
//        case .paper:
//            return opponentsThrow == .scissors ? "ScissorsCutPaper" : "PaperCoversRock"
//        case .rock:
//            return opponentsThrow == .paper ? "PaperCoversRock" : "RockCrushesScissors"
//        case .scissors:
//            return opponentsThrow == .rock ? "RockCrushesScissors" : "ScissorsCutPaper"
//        }
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MatchResultsViewController
        controller.message = "hello there!"
        
        if segue.identifier == "ResultsVCFromPaper" {
            //generateGame(playersThrow: .paper)
        }else{ //rock button was pressed
            //generateGame(playersThrow: .rock)
        }
        controller.message = outcomeMessage
        controller.imageString = imageString
    }
    
//    func generateGame(playersThrow: GamePlay) {
//        let opponentsThrow = generateOpponentsPlay()
//        setPropertiesForMatchResultsViewController(playersThrow: playersThrow, opponentsThrow: opponentsThrow)
//    }
    
//    func setPropertiesForMatchResultsViewController(playersThrow: GamePlay, opponentsThrow: GamePlay) {
//        outcomeMessage = determineWinner(playersThrow: playersThrow, opponentsThrow: opponentsThrow)
//        imageString = determineImageString(playersThrow: playersThrow, opponentsThrow: opponentsThrow)
//    }


}

