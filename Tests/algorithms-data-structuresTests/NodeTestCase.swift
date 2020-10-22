import XCTest
@testable import algorithms_data_structures

final class NodeTestCase: XCTestCase {
    
    func testInit_ShouldReturnCorrectData() {
        let node3 = Node<Int>(value: 3)
        let node2 = Node<Int>(value: 2, next: node3)
        let node1 = Node<Int>(value: 1, next: node2)
        
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.next, node2)
        
        XCTAssertEqual(node2.value, 2)
        XCTAssertEqual(node2.next, node3)
        
        XCTAssertEqual(node3.value, 3)
        XCTAssertNil(node3.next)
    }
    
    func testDescription() {
        let node2 = Node<Int>(value: 2)
        let node1 = Node<Int>(value: 1, next: node2)
        
        let tree = Tree<Int>(0)
        
        tree.add(.)
        
        XCTAssertEqual(node1.description, "\(1) -> \(node2.description)")
    }
}
