//
//  Katakana.swift
//  SimpleKatakanaPractice
//
//  Created by Joshua Zierman on 10/22/20.
//

import Foundation

let katakanaData: [Katakana] = KatakanaJsonLoader.load("Katakana.json")

struct Katakana: Hashable, Codable, Identifiable {
    var id: Int
    var katakana: String
    var phonetic: [String]
    
    init(_ id: Int, _ katakana: String, _ phonetic : [String] ) {
        self.id = id
        self.katakana = katakana
        self.phonetic = phonetic
    }
}

final class KatakanaJsonLoader {
    static func load(_ filename: String) -> [Katakana] {
        
        var rawData: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename).")
        }
        
        do {
                rawData = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(filename):\n\(error)")
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Katakana].self, from: rawData)
            } catch {
                fatalError("Couldn't parse \(filename) as \([Katakana].self):\n\(error)")
            }
    }
}
