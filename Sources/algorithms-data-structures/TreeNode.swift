public class Tree<T> {
    
    public var root: TreeNode<T>
    
    public init(_ value: T) {
        root = .root(value: value, children: [])
    }
    
    public func add(_ child: TreeNode<T>) throws {
        
        guard case .node = child else { throw NodeAdditionError.invalidNodeAddition }
        
        print(root.children)
        root.children.append(child)
        print(root.children)
    }
}

extension Tree {
    enum NodeAdditionError: Error {
        case invalidNodeAddition
    }
}


public indirect enum TreeNode<T> {
    case root(value: T, children: [TreeNode])
    case node(value: T, parent: TreeNode, children: [TreeNode])
    
    var parent: TreeNode? {
        switch self {
            case .root:
                return nil
            case .node(_, let parent, _):
                return parent
        }
    }
    
    var value: T {
        switch self {
            case .root(let value, _),
                 .node(let value, _, _):
                return value
        }
    }
    
    var children: [TreeNode] {
        
        get {
            switch self {
            case .root(_, let children),
                 .node(_, _, let children):
                return children
            }
        }
        
        
        set {
            switch self {
                case .root(let value, let children):
                    guard newValue != children else { return }
                    self = .root(value: value, children: newValue)
                    
                case .node(let value, let parent, let children):
                    guard newValue != children else { return }
                    self = .node(value: value, parent: parent, children: newValue)
            }
        }
    }
}

extension TreeNode: Equatable {
    
    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        
        switch (lhs, rhs) {
            case (.root, .root):
                return true

            case (.node(_, let lhsParent, _), .node(_, let rhsParent, _)):
                return lhsParent == rhsParent
                
            default:
                return false
        }
    }
    
}
