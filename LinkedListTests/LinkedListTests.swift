//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Башир Арсланалиев on 12.12.2021.
//

import XCTest
@testable import LinkedList

class LinkedListTests: XCTestCase {
    
    var intLinkedList: LinkedList<Int>!
    var array: [Int]!

    override func setUpWithError() throws {
        array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        intLinkedList = .init(array)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testCreationFromArray() {
        for index in 0 ..< array.count {
            XCTAssert(intLinkedList[index] == array[index])
        }
        
        XCTAssert(intLinkedList.count == array.count)
    }
    
    func testCreateFromEmptyArray() {
        let list = LinkedList<Int>([])
        
        XCTAssert(list.first == nil)
        XCTAssert(list.last == nil)
    }
    
    func testCreateFromItem() {
        let number = 5
        let list = LinkedList(number)
        
        XCTAssert(list[0] == number)
    }

    func testSubscriptForGettingValueAtIndex() {
        let number = intLinkedList[2]
        XCTAssert(number == 2)
    }
    
    func testInsertionOneElementInLinkedList() {
        let numberToInsert = 123
        let indexToInsert = 3
        
        intLinkedList.insert(numberToInsert, at: indexToInsert)
        
        let resultNumber = intLinkedList[indexToInsert]
        
        XCTAssert(resultNumber == numberToInsert)
    }
    
    func testInsertionOfCollection() {
        let arrayToInsert = [123, 234, 345]
        let indexToInsert = 3
        
        intLinkedList.insert(contentsOf: arrayToInsert, at: indexToInsert)
        
        let resultArray = Array(intLinkedList[3...5])
        
        XCTAssert(resultArray.count == arrayToInsert.count)
        XCTAssert(resultArray == arrayToInsert)
    }
    
    func testSequenceConformance() {
        for (listValue, arrayValue) in zip(intLinkedList, array) {
            XCTAssert(listValue == arrayValue)
        }
    }
}
