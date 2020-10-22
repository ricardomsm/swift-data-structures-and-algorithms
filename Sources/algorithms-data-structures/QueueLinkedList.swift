public class QueueLinkedList<T>: Queue {
    
    // MARK: - Properties

    private var list = DoublyLinkedList<T>()
    
    public var isEmpty: Bool { list.isEmpty }
    
    public var peek: T? { list.first?.value }
    
    // MARK: - Initializers
    
    public init() {}
    
    // MARK: - Public methods
    
    public func enqueue(_ element: T) -> Bool {
        
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        return list.remove(element)
    }
}

// MARK: - Extensions

extension QueueLinkedList: CustomStringConvertible {
    
    public var description: String { list.description }
}
