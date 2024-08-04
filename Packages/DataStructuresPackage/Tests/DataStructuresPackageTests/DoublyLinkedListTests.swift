@testable import DataStructuresPackage
import XCTest

final class DoublyLinkedListTests: XCTestCase {
    func test_givenInitialized_thenInitialParametersMatched() {
        let sut = makeSUT()
        
        XCTAssertTrue(sut.count == 0)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_givenInitialized_whenValueAppended_thenParametersMatched() {
        var sut = makeSUT()

        sut.append(5)

        XCTAssertTrue(sut.count == 1)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_givenInitialized_andValueAppended_whenValueRemoved_thenParametersMatched_andRemovedValueMatched() {
        var sut = makeSUT()
        sut.append(5)

        let removedValue = sut.removeLast()

        XCTAssertTrue(sut.count == 0)
        XCTAssertTrue(sut.isEmpty)
        XCTAssertEqual(removedValue as? Int, 5)
    }

    func test_givenInitialized_whenValuePushed_thenParametersMatched() {
        var sut = makeSUT()

        sut.push(5)

        XCTAssertTrue(sut.count == 1)
        XCTAssertFalse(sut.isEmpty)
    }

    func test_givenInitialized_andValuePushed_whenValuePoped_thenParametersMatched_andPopedValueMatched() {
        var sut = makeSUT()
        sut.push(5)

        let popedValue = sut.pop()

        XCTAssertTrue(sut.count == 0)
        XCTAssertTrue(sut.isEmpty)
        XCTAssertEqual(popedValue as? Int, 5)
    }

    func test_givenInitialized_andValueAppended_whenZeroIndexHasValue_thenParametersMatched_andValueMatched() {
        var sut = makeSUT()
        sut.append(5)

        let valueAtIndex = sut.value(at: 0)

        XCTAssertTrue(sut.count == 1)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(valueAtIndex as? Int, 5)
    }

    func test_givenInitialized_andValuesAppended_whenValueAfterIndexRemoved_thenParametersMatched_andValueMatched() {
        var sut = makeSUT()
        sut.append(5)
        sut.append(4)
        sut.append(43)

        let removedValueAfterIndex = sut.remove(after: 1)

        XCTAssertTrue(sut.count == 2)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(removedValueAfterIndex as? Int, 43)
    }

    func test_givenInitialized_andValuesAppended_whenValueAfterIndexInserted_thenParametersMatched() {
        var sut = makeSUT()
        sut.append(5)
        sut.append(4)
        sut.append(43)

        sut.insert(123, after: 1)

        XCTAssertTrue(sut.count == 4)
        XCTAssertFalse(sut.isEmpty)
    }
}

// MARK: - makeSUT
private extension DoublyLinkedListTests {
    func makeSUT() -> DoublyLinkedList<Any> {
        DoublyLinkedList()
    }
}
