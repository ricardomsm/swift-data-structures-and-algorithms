/// Implementation of a queue using an array as a means of storage
public struct QueueArray<T>: Queue {
    
    // MARK: - Properties
    
    private var array: [T] = []
    
    public var peek: T? { array.first }
    public var isEmpty: Bool { array.isEmpty }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Public methods
    
    public mutating func enqueue(_ element: T) -> Bool {
        
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? { isEmpty ? nil : array.removeFirst() }
}

// MARK: - Extensions

extension QueueArray: CustomStringConvertible {
    
    public var description: String { array.description }
}
