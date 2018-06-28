//
//  ViewController.swift
//  Set
//
//  Created by Chris Wright on 6/28/18.
//  Copyright © 2018 Chris Wright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateViewFromModel()
        
    }
    
    var game = Set()
    
    @IBAction func touchCard(_ sender: UIButton) {
        print("card touched")
        updateViewFromModel()
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func dealThreeCards() {
        print("dealing three cards")
        game.dealThreeMoreCards()
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
        //Update cards
        for index in 0 ..< cardButtons.count{
            updateCardInView(at: index)
        }
        //Update score
    }
    
    func updateCardInView(at index: Int){
        if index < game.table.count { //if there is a card at the specified index display it
            let cardInModel = game.table[index]
            
            var attributes = [NSAttributedStringKey : Any]()
            
            var symbol: String {
                switch cardInModel.symbol {
                case .diamond: return "▲"
                case .squiggle: return "■"
                case .oval: return "●"
                }
            }
            
            var text: String {
                switch cardInModel.number {
                case .one: return symbol
                case .two: return symbol + symbol
                case .three: return symbol + symbol + symbol
                }
            }
            
            var color: UIColor {
                switch cardInModel.color {
                case .red: return UIColor.red
                case .green: return UIColor.green
                case .purple: return UIColor.purple
                }
            }
            
            switch cardInModel.shading {
            case .solid:
                attributes[.foregroundColor] = color.withAlphaComponent(1)
                attributes[.strokeWidth] = -1
            case .striped:
                attributes[.foregroundColor] = color.withAlphaComponent(0.15)
                attributes[.strokeWidth] = -1
            case .open:
                attributes[.foregroundColor] = color.withAlphaComponent(0)
                attributes[.strokeWidth] = 2
                attributes[.strokeColor] = color
            }
            
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            
            cardButtons[index].setAttributedTitle(attributedText, for: UIControlState.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        } else { //No card here, so we will set to transparent
            let blankTitle = NSAttributedString(string: "")
            cardButtons[index].setAttributedTitle(blankTitle, for: UIControlState.normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
    }
    
}

