public final class Node<Value> {
    
    // MARK: - Properties
    
    public var value: Value
    public var next: Node?
    public var previous: Node?
    
    // MARK: - Initializer
    
    public init(value: Value, next: Node? = nil, previous: Node? = nil) {
        
        self.value = value
        self.next = next
        self.previous = previous
    }
}

// MARK: - Extensions

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(String(describing: next))"
    }
}

extension Node: Equatable where Value: Equatable {
    
    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        lhs.value == rhs.value && lhs.next == rhs.next
    }
}
