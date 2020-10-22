//
//  ArrayQueue.swift
//  SimpleKatakanaPractice
//
//  Created by Joshua Zierman on 10/22/20.
//

import Foundation

protocol Queue {
    associatedtype ContentsType
    mutating func enqueue(_ newElement: ContentsType) -> Void
    mutating func dequeue() -> ContentsType?
    func isEmpty() -> Bool
    mutating func clear() -> Void
}

struct ArrayQueue <T>: Queue{
    
    var array = [T]()
    
    mutating func enqueue(_ newElement: T) {
        array.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        return array.remove(at: 0)
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    mutating func clear() {
        array.removeAll()
    }
    
    typealias ContentsType = T
    
    
}
