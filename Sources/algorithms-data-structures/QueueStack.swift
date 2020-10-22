public struct QueueStack<T>: Queue {
    
    // MARK: - Properties
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public var peek: T? { !leftStack.isEmpty ? leftStack.last : rightStack.first }
    public var isEmpty: Bool { leftStack.isEmpty && rightStack.isEmpty }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Public methods
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
 
        return leftStack.popLast()
    }
}

extension QueueStack: CustomStringConvertible {
    
    public var description: String {
        let printList = leftStack + rightStack.reversed()
        return printList.description
    }
}
