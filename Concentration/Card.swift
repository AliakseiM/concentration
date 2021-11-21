//
//  Card.swift
//  Concentration
//
//  Created by Алексей Михайловский on 11/21/21.
//  Copyright © 2021 Алексей Михайловский. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
}
