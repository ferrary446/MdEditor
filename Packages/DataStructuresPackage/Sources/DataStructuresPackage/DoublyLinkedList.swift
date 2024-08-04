//
//  DoublyLinkedList.swift
//
//
//  Created by Ilya Yushkov on 04.08.2024.
//

struct DoublyLinkedList<T> {
    class Node {
        var previous: Node?
        var next: Node?

        let value: T

        init(_ value: T, previous: Node? = nil, next: Node? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }

    var isEmpty: Bool { head == nil && tail == nil }
    
    private(set) var count = 0
    
    private var head: Node?
    private var tail: Node?

    init(_ value: T? = nil) {
        if let value = value {
            let newNode = Node(value)
            self.head = newNode
            self.tail = newNode
            count = 1
        }
    }

    /// Возвращает значение по индексу.
    /// - Parameter index: Индекс, по которому нужно вернуть значение.
    /// - Returns: Возвращаемое значение.
    func value(at index: Int) -> T? {
        node(at: index)?.value
    }

    /// Добавление в начало списка значения.
    ///
    /// Сложность O(1).
    /// - Parameter value: Значение, которое будет добавлено в список.
    mutating func push(_ value: T) {
        count += 1
        
        let newNode = Node(value, next: head) // есть ссылка на следующий
        head?.previous = newNode
        head = newNode
        
        if tail == nil { tail = head }
    }
    
    /// Добавление в конец списка значения.
    ///
    /// Сложность O(1).
    /// - Parameter value: Значение, которое будет добавлено в список.
    mutating func append(_ value: T) {
        count += 1
        
        let newNode = Node(value, previous: tail) // есть ссылка на предыдущий
        tail?.next = newNode
        tail = newNode
        
        if head == nil { head = tail }
    }
    
    /// Вставка в середину списка значения.
    ///
    /// Сложность O(n).
    /// - Parameters:
    ///   - value: Значение, которое будет вставлено в список;
    ///   - index: Индекс, после которого будет вставлено значение.
    mutating func insert(_ value: T, after index: Int) {
        guard let currentNode = node(at: index) else { return }
        
        count += 1
        
        let nextNode = currentNode.next
        let newNode = Node(value, previous: currentNode, next: nextNode)
        currentNode.next = newNode
        nextNode?.previous = newNode
        
        if newNode.next == nil { tail = newNode }
    }
    
    /// Извлечение значения из начала списка.
    ///
    /// Сложность O(1).
    /// - Returns: Извлеченное из списка значение.
    mutating func pop() -> T? {
        guard let currentHead = head else { return nil }
        
        head = currentHead.next
        head?.previous = nil
        if head == nil { tail = nil }
        
        count -= 1
        
        return currentHead.value
    }
    
    /// Извлечение значения c конца списка.
    ///
    /// Сложность O(1).
    /// - Returns: Извлеченное из списка значение.
    mutating func removeLast() -> T? {
        guard let currentTail = tail else { return nil }
        
        tail = currentTail.previous
        tail?.next = nil
        if tail == nil { head = nil }
        
        count -= 1
        
        return currentTail.value
    }
    
    /// Извлечение значения из середины списка.
    /// - Parameter index: Индекс, после которого надо извлеч значение.
    /// - Returns: Извлеченное из списка значение.
    mutating func remove(after index: Int) -> T? {
        guard
            let currentNode = node(at: index),
            let nextNode = currentNode.next
        else { return nil }
        
        if nextNode === tail {
            tail = currentNode
            currentNode.next = nil
        } else {
            currentNode.next = nextNode.next
            nextNode.next?.previous = currentNode
        }
        
        count -= 1
        
        return nextNode.value
    }
}

extension DoublyLinkedList.Node: CustomStringConvertible {
    var description: String {
        "\(value)"
    }
}

private extension DoublyLinkedList {
    func node(at index: Int) -> Node? {
        guard index >= 0 && index < count else { return nil }

        var currentIndex = 0
        var currentNode: Node?

        if index <= count / 2 {
            currentNode = head

            while currentIndex < index {
                currentIndex += 1
                currentNode = currentNode?.next
            }
        } else {
            currentIndex = count - 1
            currentNode = tail

            while currentIndex > index {
                currentIndex -= 1
                currentNode = currentNode?.previous
            }
        }

        return currentNode
    }
}
