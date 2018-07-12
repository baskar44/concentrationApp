//
//  ViewController.swift
//  concentrationApp
//
//  Created by Gururaj Baskaran on 11/7/18.
//  Copyright © 2018 Gururaj Baskaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:- Variables
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    var flipCount = 0 {
        didSet {
            lblFlipCount.text = "Flips: \(flipCount)"
        }
    }
    var emojis = ["👻", "🤖", "🐷", "🐙", "🦉", "⚽️", "🍪", "🎃", "😵", "👍", "🦁", "🦇"]
    var emoji = [Int:String]()
    
    // MARK:- IBOutlets
    @IBOutlet weak var lblFlipCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    

    // MARK:- IBActions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewForModel()
        }else {
            print("chosen card does not exist.")
        }
    }
    
    // MARK:- Functions
    func updateViewForModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card .isFaceUp {
                button.setTitle(emoji(for:card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9333333333, green: 0.4980392157, blue: 0.3725490196, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String? {
        
        if emoji[card.id] == nil, emojis.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emoji[card.id] = emojis.remove(at: randomIndex)
        }
        
        return emoji[card.id] ?? "?"
    }
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

