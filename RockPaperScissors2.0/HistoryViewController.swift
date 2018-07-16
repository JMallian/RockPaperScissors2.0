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
    var history: [String]?
    
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
        return cell!
    }
    
}
