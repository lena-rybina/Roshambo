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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let gameState = gameState else { return }
        
        switch gameState {
        case let .win(title, imageName),
             let .lose(title, imageName),
             let .tie(title, imageName):
            resultLabel.text = title
            resultImage.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func dismiss() {
        // dismiss this view controller
        self.dismiss(animated: true, completion: nil)
    }
}


