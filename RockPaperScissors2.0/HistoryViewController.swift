//
//  HistoryViewController.swift
//  RockPaperScissors2.0
//
//  Created by Jessica Mallian on 7/16/18.
//  Copyright © 2018 Jessica Mallian. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var historyTableView: UITableView!
    var history: [Game]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let history = self.history {
            return history.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "historyCell")
        cell?.textLabel?.text = "hi"
        if let history = self.history {
            cell?.textLabel?.text = history[indexPath.row].outcomeString
        }else{
            cell?.textLabel?.text = "something went wrong in cellForRowAt method"
        }
        
        //change background color depending on if you won or lost game
        if history != nil {
            if history![indexPath.row].getWinner() == .player {
                cell?.backgroundColor = .green
            }else if history![indexPath.row].getWinner() == .computer {
                cell?.backgroundColor = .red
            }else{ //tie game
                cell?.backgroundColor = .gray
            }
        }
        
        return cell!
    }
    
}
