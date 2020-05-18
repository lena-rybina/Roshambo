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
    
    var userInput: GameSelectionType?
    var computerInput: GameSelectionType?
    
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
        
        self.userInput = userInput
        self.computerInput = computerInput
        
        self.gameState = GameEngine.gameCheck(userInput: userInput,
                                              computerInput: computerInput)
        
        performSegue(withIdentifier: "resultSegue",
                     sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue",
            let controller = segue.destination as? ResultViewController {
            
            controller.gameState = gameState
            
            guard let userInput = userInput,
                let computerInput = computerInput else { return }
            controller.gameCheck = (userInput,
                                    computerInput)
        
        }
    }
}
