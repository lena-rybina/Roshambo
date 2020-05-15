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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let allCases = GameSelectionType.allCases
        allCases.randomElement()
        
        print("Is game working - \(GameEngine.gameCheck(userInput: .rock, computerInput: .paper))")
    }
}

    
