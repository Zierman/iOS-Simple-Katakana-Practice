//
//  AppData.swift
//  SimpleKatakanaPractice
//
//  Created by Joshua Zierman on 10/22/20.
//

import SwiftUI
import Combine

final class AppData: ObservableObject {
    
    @Published var currentKatakana: Katakana
    @Published var input = ""
    var deck = [Katakana]()
    var katakanaQueue = ArrayQueue<Katakana>()
    
    init() {
        for k in katakanaData {
            deck.append(k)
        }
        deck.shuffle()
        for card in deck {
            katakanaQueue.enqueue(card)
        }
        
        currentKatakana = katakanaQueue.dequeue()!
    }
    
    private func reloadQueueIfNeeded() {
        if katakanaQueue.isEmpty() {
        deck.shuffle()
        for card in deck {
            katakanaQueue.enqueue(card)
        }
        }
    }
    
    func nextKatakana() {
        reloadQueueIfNeeded()
        currentKatakana = katakanaQueue.dequeue()!
    }
    
}
