//
//  ViewController.swift
//  Concentration
//
//  Created by Алексей Михайловский on 20.11.2021.
//  Copyright © 2021 Алексей Михайловский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numberOfPairs: numberOfPairs)
    
    var numberOfPairs: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet{
            touchLabel.text = "Touches: \(touches)"
        }
    }

    
    private var emojiCollection = ["🦊", "🦁", "🐰", "🐻", "🦕", "🐙", "🐼", "🐮", "🐭", "🐿", "🐠", "🐒"]
    
    private var emojiDictionary = [Int:String]()
    
    private func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
            
        }
        
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    private func updateViewFromModels() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    

    @IBOutlet private var buttonCollection: [UIButton]!
    @IBOutlet private weak var touchLabel: UILabel!
    @IBAction private func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.choseCard(at: buttonIndex )
            updateViewFromModels()
        }
    }
    
}

