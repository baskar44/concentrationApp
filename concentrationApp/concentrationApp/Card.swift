//
//  Card.swift
//  concentrationApp
//
//  Created by Gururaj Baskaran on 12/7/18.
//  Copyright © 2018 Gururaj Baskaran. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    static var idFactory = 0
    static func getUniqueId() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
