//
//  GameProcessor.swift
//  Roshambo
//
//  Created by Ielena Rybina on 5/11/20.
//  Copyright © 2020 Elena Rybina. All rights reserved.
//

import Foundation

enum GameState {
    case win
    case lose
    case tie
}

enum GameSelectionType: CaseIterable {
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
            return .win
        case (let currentValue, let inputValue) where currentValue == inputValue:
            return .tie
        default:
            return .lose
        }
    }
}
