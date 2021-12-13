//
//  LinkedList.swift
//  LinkedList
//
//  Created by Башир Арсланалиев on 12.12.2021.
//

import Foundation

public struct LinkedList<Element> {
    
    /// First item of linked list
    var firstItem: ListNode<Element>?
    
    /// Last item of linked list. Complexity O(n)
    var lastElement: ListNode<Element>? {
        self[listElementAt: count - 1]
    }
    
    // MARK: - Inits
    
    /// Creates a linked list object from AnyCollection object. Complexity O(n)
    public init(_ collection: AnyCollection<Element>) {
        guard let firstCollection = collection.first else { return }
        self.firstItem = ListNode(firstCollection)
        
        var obj = self.firstItem
        
        for element in collection.suffix(collection.count - 1) {
            obj?.next = ListNode(element)
            obj = obj?.next
        }
    }
    
    /// Creates a linked list object with one element
    public init(_ firstElement: Element) {
        self.firstItem = ListNode(firstElement)
    }
    
    public init() { }
    
    // MARK: - Private Methods
    private subscript(listElementAt index: Int) -> ListNode<Element>? {
        get {
            var obj = firstItem
            
            for _ in 0..<index {
                obj = obj?.next
            }
            
            return obj
        }
    }
}

public struct LinkedListIterator<Element>: IteratorProtocol {
    let linkedList: LinkedList<Element>
    
    var current: ListNode<Element>?
    
    public mutating func next() -> Element? {
        if let current = current {
            self.current = current.next
            return current.next?.value
        }
        
        current = linkedList.firstItem
        
        return current?.value
    }
}

extension LinkedList: Sequence {
    public typealias Element = Element
    
    public func makeIterator() -> LinkedListIterator<Element> {
        let iterator = LinkedListIterator(linkedList: self)

        return iterator
    }
}

extension LinkedList: Collection {
    
    public var startIndex: Int { 0 }
    
    /// Complexity O(n)
    public var endIndex: Int {
        var result = 0
        var current = firstItem
        
        while current != nil {
            result += 1
            current = current?.next
        }
        
        return result
    }
    
    public func index(after i: Int) -> Int { i + 1 }
}

extension LinkedList: BidirectionalCollection {
    public func index(before i: Int) -> Int { i - 1 }
}

extension LinkedList: MutableCollection {
    
    public subscript(position: Int) -> Element {
        get {
            self[listElementAt: position]!.value
        }
        
        set {
            self[listElementAt: position]?.value = newValue
        }
    }
}

extension LinkedList: RangeReplaceableCollection {
    
    public mutating func replaceSubrange<C>(
        _ subrange: Range<Int>,
        with newElements: C
    ) where C : Collection, Element == C.Element {
        let leftIndex = subrange.lowerBound
        let rightIndex = subrange.upperBound
        
        let leftElem = self[listElementAt: leftIndex - 1]
        let rightElem = self[listElementAt: rightIndex]
        var current = leftElem
        
        for element in newElements {
            let newItem = ListNode(element)
            current?.next = newItem
            current = newItem
        }
        
        current?.next = rightElem
    }
}
