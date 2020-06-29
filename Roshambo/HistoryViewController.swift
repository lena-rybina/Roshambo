//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Elena Rybina on 6/25/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import UIKit
import Foundation

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameEngine.gameHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID,
                                                 for: indexPath)
        let matchKey = Array(GameEngine.gameHistory.keys.sorted(by: >))[indexPath.row]
        let match = GameEngine.gameHistory[matchKey]!
        
        switch match {
        case let .lose(title, _):
            cell.textLabel?.text = title
            cell.imageView?.image = UIImage(named: "loss")
            cell.backgroundColor = .red
            
        case let .win(title, _):
            cell.textLabel?.text = title
            cell.imageView?.image = UIImage(named: "win")
            cell.backgroundColor = .green
        case let .tie(title, _):
            cell.textLabel?.text = title
            cell.imageView?.image = UIImage(named: "tiehistory")
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

