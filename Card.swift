//
//  Card.swift
//  Set
//
//  Created by Chris Wright on 6/28/18.
//  Copyright © 2018 Chris Wright. All rights reserved.
//

import Foundation

class Card {
    enum Number {
        case one
        case two
        case three
    }
    
    enum Symbol {
        case diamond
        case squiggle
        case oval
    }
    
    enum Shading {
        case solid
        case striped
        case open
    }
    
    enum Color {
        case red
        case green
        case purple
    }
    
    let number: Number
    let symbol: Symbol
    let shading: Shading
    let color: Color
    
    init(number: Number, symbol: Symbol, shading: Shading, color: Color){
        self.number = number
        self.symbol = symbol
        self.shading = shading
        self.color = color
    }
    
    
}
