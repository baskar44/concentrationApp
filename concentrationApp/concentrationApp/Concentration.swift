//
//  Concentration.swift
//  concentrationApp
//
//  Created by Gururaj Baskaran on 12/7/18.
//  Copyright © 2018 Gururaj Baskaran. All rights reserved.
//

import Foundation

class Concentration
{
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched { //If card is not matched
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if cards match
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            }else {
                // Either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        // TODO: Shuffle the cards
        var last = cards.count - 1
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            
            cards.swapAt(last, rand)
            
            print(cards)
            
            last -= 1
        }
    }
    
    
}
