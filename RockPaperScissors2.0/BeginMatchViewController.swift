//
//  ViewController.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/14/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {
    
    //todo: clean up code: abstract out repeating lines
    //add the list plays 
    
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
        // Udacity requirement: Automatically Triggered Segue: Create an automatically triggered segue in storyboard, connected directly to the rock button. In this case, the label text should also be set in the prepareForSegue method. - so this method no longer does anything
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        // Udacity requirement: Perform Segue by Identifier: Create a named segue, and invoke the performSegueWithIdentifier method in the paper button action. In this case, the label text should be set in the prepareForSegue method.
        performSegue(withIdentifier: "ResultsVCFromPaper", sender: self)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        // Udacity requirement: All code: Instantiate the results view controller using the storyboard, and set the text of its label property. Connect the action on the rock button.
        let opponentsThrow = generateOpponentsPlay()
        outcomeMessage = determineWinner(playersThrow: .scissors, opponentsThrow: opponentsThrow)
        let imageString = determineImageString(playersThrow: .scissors, opponentsThrow: opponentsThrow)
        let controller: MatchResultsViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "MatchResults") as! MatchResultsViewController
        controller.message = outcomeMessage
        controller.imageString = imageString
        present(controller, animated: true, completion: nil)
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
            return opponentsThrow == .scissors ? "Computer cuts your paper with scissors." : "You cover computer's rock."
        case .rock:
            return opponentsThrow == .paper ? "Computer covers your rock with paper." : "You crush your computer's scissors"
        case .scissors:
            return opponentsThrow == .rock ? "Computer crushes your scissors with rock." : "You cut computer's paper"
        }
    }
    
    func determineImageString(playersThrow: GamePlay, opponentsThrow: GamePlay) -> String {
        if playersThrow == opponentsThrow {
            return "itsATie"
        }
        
        switch playersThrow {
        case .paper:
            return opponentsThrow == .scissors ? "ScissorsCutPaper" : "PaperCoversRock"
        case .rock:
            return opponentsThrow == .paper ? "PaperCoversRock" : "RockCrushesScissors"
        case .scissors:
            return opponentsThrow == .rock ? "RockCrushesScissors" : "ScissorsCutPaper"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MatchResultsViewController
        controller.message = "hello there!"
        
        if segue.identifier == "ResultsVCFromPaper" {
            let opponentsThrow = generateOpponentsPlay()
            outcomeMessage = determineWinner(playersThrow: .paper, opponentsThrow: opponentsThrow)
            let imageString = determineImageString(playersThrow: .paper, opponentsThrow: opponentsThrow)
            controller.message = outcomeMessage
            controller.imageString = imageString
        }else{ //rock button was pressed
            let opponentsThrow = generateOpponentsPlay()
            outcomeMessage = determineWinner(playersThrow: .rock, opponentsThrow: opponentsThrow)
            let imageString = determineImageString(playersThrow: .rock, opponentsThrow: opponentsThrow)
            controller.message = outcomeMessage
            controller.imageString = imageString 
        }
    }


}

