public class DoublyLinkedList<T> {
    
    // MARK: - Properties

    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil

    public var first: Node<T>? { head }
    public var isEmpty: Bool { head == nil }
    
    // MARK: - Public methods

    public func append(_ value: T) {
        let newNode = Node(value: value, previous: tail)
        
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    public func node(for index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    func remove(_ node: Node<T>) -> T {
        
        let previousNode = node.previous
        let next = node.next
        
        if previousNode != nil {
            previousNode?.next = node.previous
        } else {
            head = next
        }

        next?.previous = previousNode
        
        if next == nil { tail = previousNode }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

// MARK: - Extensions

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        guard !isEmpty else { return "Empty list" }
        return String(describing: head)
    }
}
