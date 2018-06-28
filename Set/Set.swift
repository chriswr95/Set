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
    private(set) var indicesOfSelectedCards = [Int]() //should never be larger than 3 cards
    
    func chooseCard(atIndex index: Int) { //index must be inbounds
        if(indicesOfSelectedCards.count < 3){
            if let chosenCardIndex = indicesOfSelectedCards.index(of: index) {
                indicesOfSelectedCards.remove(at: chosenCardIndex)
            } else {
                indicesOfSelectedCards.append(index)
            }
            print(indicesOfSelectedCards)
        } else { //matched?
            var selectedCards = [Card]()
            for index in indicesOfSelectedCards {
                selectedCards.append(table[index])
            }
            let matched = match(selectedCards)
            print(matched)
        }
    }
    
    private func match(_ cards: [Card]) -> Bool{
        print("matching")
        var colors = Swift.Set<Card.Color>()
        var numbers = Swift.Set<Card.Number>()
        var symbols = Swift.Set<Card.Symbol>()
        var shades = Swift.Set<Card.Shading>()
        for card in cards {
            colors.insert(card.color)
            numbers.insert(card.number)
            symbols.insert(card.symbol)
            shades.insert(card.shading)
        }
        
        if colors.count == 2 || numbers.count == 2 || symbols.count == 2 || shades.count == 2 {
            return false
        } else {
            return true
        }

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
