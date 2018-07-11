//
//  ViewController.swift
//  concentrationApp
//
//  Created by Gururaj Baskaran on 11/7/18.
//  Copyright © 2018 Gururaj Baskaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var flipCount = 0 {
        didSet {
            lblFlipCount.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var lblFlipCount: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojis = ["👻", "🤖", "👻", "🐷", "🐷", "🤖"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojis[cardNumber], on: sender)
        }else {
            print("chosen card does not exist.")
        }
    }
    

    
    func flipCard(withEmoji emoji:String, on button:UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

