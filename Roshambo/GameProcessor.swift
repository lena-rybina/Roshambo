//
//  GameProcessor.swift
//  Roshambo
//
//  Created by Ielena Rybina on 5/11/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import Foundation

enum GameState {
    case win(title: String, imageName: String)
    case lose(title: String, imageName: String)
    case tie(title: String, imageName: String)
}

enum GameSelectionType: String, CaseIterable {
    case rock
    case paper
    case scissors
}

class GameEngine {
    static func gameCheck(userInput: GameSelectionType,
                          computerInput: GameSelectionType)-> GameState {
        switch (userInput, computerInput) {
        case (.paper, .rock),
             (.rock, .scissors),
             (.scissors, .paper):
            
            return .win(title: "You won!", imageName: "\(userInput)-\(computerInput)")
        case (let currentValue, let inputValue) where currentValue == inputValue:
            return .tie(title: "It's a tie!", imageName: "tie")
        default:
            return .lose(title: "You lost!", imageName: "\(computerInput)-\(userInput)")
        }
    }
}
