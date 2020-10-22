public struct QueuedRingBuffer<T>: Queue {
    
    // MARK: - Properties

    public var peek: T? { ringBuffer.first }
    public var isEmpty: Bool { ringBuffer.isEmpty }

    private var ringBuffer: RingBuffer<T>
    
    // MARK: - Initializers
    
    public init(count: Int) { ringBuffer = .init(count: count) }
    
    // MARK: - Public methods
    
    public mutating func enqueue(_ element: T) -> Bool { ringBuffer.write(element) }
    
    public mutating func dequeue() -> T? { isEmpty ? nil : ringBuffer.read() }
}

extension QueuedRingBuffer: CustomStringConvertible {
    
    public var description: String { ringBuffer.description }
}
