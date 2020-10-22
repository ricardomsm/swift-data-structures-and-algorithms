import XCTest
@testable import algorithms_data_structures

final class LinkedListTestCase: XCTestCase {
    
    var linkedList: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        
        linkedList = .init()
    }
    
    override func tearDown() {
        linkedList = nil
        super.tearDown()
    }
    
    func testEmptyList() {
        XCTAssert(linkedList.isEmpty)
    }
    
    func testPush() {
        linkedList.push(2)
        linkedList.push(1)
        
        XCTAssertFalse(linkedList.isEmpty)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 2)
    }
    
    func testAppend() {
        linkedList.append(1)
        linkedList.append(2)
        
        XCTAssertFalse(linkedList.isEmpty)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.head?.next?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 2)
    }
    
    func testInsert() {
        
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.head?.next?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        guard let node2 = linkedList.node(at: 1) else {
            XCTFail("💥 Couldn't find node at index 1")
            return
        }
        
        linkedList.insert(23, after: node2)
        
        XCTAssertEqual(linkedList.node(at: 2)?.value, 23)
    }
    
    func testPop() {
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        XCTAssertEqual(linkedList.head?.value, 1)
        
        let pastHead = linkedList.pop()
        
        XCTAssertEqual(pastHead, 1)
        XCTAssertEqual(linkedList.head?.value, 2)
    }
    
    func testNodeAt() {
        linkedList.append(1)
        linkedList.append(2)
        
        XCTAssertEqual(linkedList.node(at: 1)?.value, 2)
    }
}
