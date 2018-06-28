//
//  Set.swift
//  Set
//
//  Created by Chris Wright on 6/28/18.
//  Copyright © 2018 Chris Wright. All rights reserved.
//

import Foundation

class Set
{
    private var deck = [Card]() //NOTE: cards in deck are ordered, "shuffling" is achieved by picking a card at a random index from deck
    private(set) var table = [Card]() //should never be larger than 24 cards
    private(set) var selectedCards = [Card]() //should never be larger than 3 cards
    
    func chooseCard() {
        
    }
    
    func dealThreeMoreCards(){
        if table.count < 22 {
            dealThisMany(cards: 3)
        }
    }
    
    private func dealThisMany(cards numberOfCards: Int){
        for _ in 1...numberOfCards {
            let dealtCard = deck.remove(at: deck.count.arc4random)
            table.append(dealtCard)
        }
    }
    
    init() {
        var i = 0
        //Generate 81 Unique Cards
        for number in Card.Number.allValues {
            for color in Card.Color.allValues {
                for symbol in Card.Symbol.allValues {
                    for shading in Card.Shading.allValues{
                        i += 1
//                        print("\(number) \(color) \(symbol) \(shading) Card Number: \(i)")
                        deck.append(Card(number: number, symbol: symbol, shading: shading, color: color))
                    }
                }
            }
        }
        
        //Deal 12 random cards
        dealThisMany(cards: 12)
        
    }
    
    
}

extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
