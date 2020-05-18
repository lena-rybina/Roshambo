//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Ielena Rybina on 5/11/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!

    var gameState: GameState? = nil
    var gameCheck: (userInput: GameSelectionType, computerInput: GameSelectionType)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch gameState {
        case .win:
            resultLabel.text = "You won!"
        case .lose:
            resultLabel.text = "You lost!"
        case .tie:
            resultLabel.text = "It's a tie!"
        default:
            print("[DEBUG] not handled")
        }
        
        switch gameCheck! {
        case (.rock, .scissors),
             (.scissors, .rock):
            return resultImage.image = UIImage(named: "RockCrushesScissors")
        case (.rock, .paper),
             (.paper, .rock):
            return resultImage.image = UIImage(named: "PaperCoversRock")
        case (.paper, .scissors),
         (.scissors, .paper):
            return resultImage.image = UIImage(named: "ScissorsCutPaper")
        default:
            resultImage.image = UIImage(named: "itsATie")
        }
    }
    
    @IBAction func dismiss() {
        // dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }
}


