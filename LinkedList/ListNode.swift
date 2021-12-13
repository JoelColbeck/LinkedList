//
//  ListItem.swift
//  LinkedList
//
//  Created by Башир Арсланалиев on 12.12.2021.
//

import Foundation

final class ListNode<Element> {
    var value: Element
    var next: ListNode<Element>?
    
    init(_ value: Element) {
        self.value = value
    }
}
