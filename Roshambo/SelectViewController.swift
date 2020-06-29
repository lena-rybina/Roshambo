//
//  ViewController.swift
//  Roshambo
//
//  Created by Ielena Rybina on 5/11/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import Foundation
import UIKit

class SelectViewController: UIViewController {
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    var gameState: GameState?
    var match: GameEngine!
  
    @IBAction func onButtonTap(_ sender: UIButton) {
        let allCases = GameSelectionType.allCases
        
        let computerInput = allCases.randomElement()!
        
        var userInput: GameSelectionType
        
        switch sender {
        case let button where button == rockButton:
            userInput = .rock
        case let button where button == paperButton:
            userInput = .paper
        case let button where button == scissorsButton:
            userInput = .scissors
        default:
            userInput = .scissors
        }
        
        gameState = GameEngine.gameCheck(userInput: userInput,
                                         computerInput: computerInput)
        if let gameState = gameState {
            GameEngine.updateGameHistory(with: gameState)
        }
        
        performSegue(withIdentifier: "resultSegue",
                     sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue",
            let controller = segue.destination as? ResultViewController {
            
            controller.gameState = gameState
        }
    }
}
