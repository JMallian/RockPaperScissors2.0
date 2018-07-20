//
//  MatchResultsViewController.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/14/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//


import UIKit

class MatchResultsViewController: UIViewController {
    
    //MARK: properties
    @IBOutlet weak var displayResultsLabel: UILabel!
    @IBOutlet weak var displayResultsImage: UIImageView!
    var message: String?
    var imageString: String?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let message = self.message {
            displayResultsLabel.text = message
        }else{
            displayResultsLabel.text = "Hmm, view controller didn't get the message. A bit weird, that."
        }
        
        if let imageString = self.imageString {
            displayResultsImage.image = UIImage(named: imageString)
        }else{
            print("image string not passed to view controller")
        }
    }
    
    //MARK: methods
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
}

