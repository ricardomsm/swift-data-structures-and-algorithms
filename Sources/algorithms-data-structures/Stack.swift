public struct Stack<Element> {
    
    // MARK: - Properties
    
    private var storage: [Element] = []
    
    public var isEmpty: Bool { storage.isEmpty }
    
    // MARK: - Initializers
    
    public init() {}
    
    public init(_ elements: [Element]) { storage = elements }
    
    // MARK: - Public methods
    
    public mutating func push(_ element: Element) { storage.append(element) }
    
    @discardableResult
    public mutating func pop() -> Element? { storage.popLast() }
    
    public func peek() -> Element? { storage.last }
}

// MARK: - Extensions

extension Stack: CustomStringConvertible {
    
    public var description: String {
        
        let topDivider = "---top---\n"
        let bottomDivider = "\n---------"
        
        let stackElements = storage
            .map(String.init(describing:))
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: Element...) { storage = elements }
}
