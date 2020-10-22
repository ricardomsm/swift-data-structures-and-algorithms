import Foundation

public struct LinkedList<Value> {
    
    // MARK: - Properties
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public var isEmpty: Bool { head == nil }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Public methods

    public mutating func push(_ value: Value) {
        
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil { tail = head }
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail?.next = .init(value: value)
        tail = tail?.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        
        copyNodes()
        
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = .init(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        
        defer {
            head = head?.next
            if isEmpty { tail = nil }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        
        copyNodes()
        
        guard let head = head else { return nil }
        
        guard head.next != nil else { return pop() }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        copyNodes()
        
        defer {
            if node.next === tail { tail = node }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    // MARK: - Private methods
    
    private mutating func copyNodes() {
        
        guard !isKnownUniquelyReferenced(&head), var oldNode = head else { return }
        
        head = .init(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = .init(value: nextOldNode.value)
            newNode = newNode?.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
}

// MARK: - Extensions

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else { return "Empty list"}
        
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    
    public var startIndex: Index { .init(node: head) }
    
    public var endIndex: Index { .init(node: tail?.next) }
    
    public func index(after i: Index) -> Index { .init(node: i.node?.next) }
    
    public subscript(position: Index) -> Value { position.node!.value }
    
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        public static func == (lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case (let left?, let right?):
                return left.next === right.next
                
            case (nil ,nil):
                return true
                
            default:
                return false
            }
        }
        
        public static func < (lhs: Index, rhs: Index) -> Bool {
            
            guard lhs != rhs else { return false }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
}
