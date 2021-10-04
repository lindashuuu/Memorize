//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by linda shu on 10/1/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let emojis: [String] = ["🚁", "🛩", "🚢","✈️","🚑","🚀","🚞","🚚","🚗","🛴", "🛶", "🚖", "🦽", "🚊"]
    
    static func createMemoryGanme() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex]}
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGanme()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
