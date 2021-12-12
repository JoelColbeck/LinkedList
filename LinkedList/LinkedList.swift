//
//  LinkedList.swift
//  LinkedList
//
//  Created by Башир Арсланалиев on 12.12.2021.
//

import Foundation

public struct LinkedList<Base> {
    
    // MARK: - Public Properties
    public var first: Base? {
        firstElement?.value
    }
    
    public var last: Base? {
        lastElement?.value
    }
    
    public var count = 0
    
    // MARK: - Private Properties
    private var firstElement: ListElement<Base>?
    
    private var lastElement: ListElement<Base>? {
        var obj = firstElement
        
        while let next = obj?.next {
            obj = next
        }
        
        return obj
    }
    
    // MARK: - Inits
    init(_ collection: AnyCollection<Base> = AnyCollection([])) {
        guard let firstCollection = collection.first else { return }
        self.firstElement = ListElement(firstCollection)
        
        var obj = self.firstElement
        
        for element in collection.suffix(collection.count - 1) {
            obj?.next = ListElement(element)
            obj = obj?.next
        }
        
        count = collection.count
    }
    
    init(_ firstElement: Base) {
        self.firstElement = ListElement(firstElement)
        count += 1
    }
    
    // MARK: - Public Methods
    public func append(_ item: Base) {
        lastElement?.next = ListElement(item)
    }
    
    public func insert(_ item: Base, at index: Int) {
        let insertedObject = ListElement(item)
        
    }
    
    public subscript(index: Int) -> Base? {
        get {
            var obj = firstElement
            
            for _ in 0...index {
                obj = obj?.next
            }
            
            return obj?.value
        }
    }
    
    // MARK: - Private Methods
    private subscript(listElementAt index: Int) -> ListElement<Base>? {
        get {
            var obj = firstElement
            
            for _ in 0...index {
                obj = obj?.next
            }
            
            return obj
        }
    }
    
}

fileprivate final class ListElement<Base> {
    let value: Base
    var next: ListElement<Base>?
    
    init(_ value: Base) {
        self.value = value
    }
}
