public class Stack<T>: CustomStringConvertible {
    private var container: [T] = [T]()
    public func push(_ thing: T) {
        container.append(thing)
    }
    public func pop() -> T {
        return container.removeLast()
    }
    public var description: String { return container.description }    
}
