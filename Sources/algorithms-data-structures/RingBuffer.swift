import Foundation

public struct RingBuffer<T> {
    
    private var array: [T?]
    private var readIndex: Atomic<Int> = .init(0)
    private var writeIndex: Atomic<Int> = .init(0)
    
    public init(count: Int) { array = .init(repeating: nil, count: count) }

    public mutating func write(_ element: T) -> Bool {

        guard !isFull else { return false }
        
        array[writeIndex.value % array.count] = element
        writeIndex.value += 1
        return true
    }

    public mutating func read() -> T? {

        guard !isEmpty else { return nil }
        
        let element = array[readIndex.value % array.count]
        
        readIndex.value += 1
        return element
    }

    private var availableSpaceForReading: Int { writeIndex.value - readIndex.value }

    public var isEmpty: Bool { availableSpaceForReading == 0 }

    private var availableSpaceForWriting: Int { array.count - availableSpaceForReading }

    public var isFull: Bool { availableSpaceForWriting == 0 }
    
    public var first: T? { array.first.flatMap(identity) }
}

// MARK: - Extensions

extension RingBuffer: CustomStringConvertible {
    
    public var description: String {
        guard !isEmpty else { return "Empty buffer" }
        let readAndWriteDescription = "read: \(readIndex.value) - write: \(writeIndex.value)\n"
        return readAndWriteDescription + array.description
    }
}
