//
//  ViewController.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/14/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {
    enum GamePlay: Int {
        case rock
        case paper
        case scissors
    }
    var outcomeMessage = ""

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
        // Udacity requirement: All code: Instantiate the results view controller using the storyboard, and set the text of its label property. Connect the action on the rock button. - so this method no longer does anything
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        outcomeMessage = determineWinner(playersThrow: .paper, opponentsThrow: generateOpponentsPlay())
        // Udacity requirement: Perform Segue by Identifier: Create a named segue, and invoke the performSegueWithIdentifier method in the paper button action. In this case, the label text should be set in the prepareForSegue method.
        performSegue(withIdentifier: "ResultsVCFromPaper", sender: self)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        outcomeMessage = determineWinner(playersThrow: .scissors, opponentsThrow: generateOpponentsPlay())
        print(outcomeMessage)
    }
    
    func generateOpponentsPlay() -> GamePlay {
        let randomNumber = arc4random_uniform(3)
        print("computer plays \(GamePlay(rawValue: Int(randomNumber))!)")
        return GamePlay(rawValue: Int(randomNumber))! //I know it will exist
    }
    
    func determineWinner(playersThrow: GamePlay, opponentsThrow: GamePlay) -> String {
        if playersThrow == opponentsThrow {
            return "tie game"
        }
        
        switch playersThrow {
        case .paper:
            return opponentsThrow == .scissors ? "computer won" : "you won"
        case .rock:
            return opponentsThrow == .paper ? "computer won" : "you won"
        case .scissors:
            return opponentsThrow == .rock ? "computer won" : "you won"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MatchResultsViewController
        controller.message = "hello there!"
        
        if segue.identifier == "ResultsVCFromPaper" {
            outcomeMessage = determineWinner(playersThrow: .paper, opponentsThrow: generateOpponentsPlay())
            controller.message = outcomeMessage
        }else{ //rock button was pressed
            outcomeMessage = determineWinner(playersThrow: .rock, opponentsThrow: generateOpponentsPlay())
            controller.message = outcomeMessage
        }
    }


}

