@testable import DataStructuresPackage
import XCTest

final class QueueTests: XCTestCase {
    func test_givenInitialized_thenInitialParametersMatched() {
        let sut = makeSUT()

        XCTAssertTrue(sut.count == 0)
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
    }

    func test_givenInitialized_whenValueEnqueued_thenParametersMatched() {
        var sut = makeSUT()

        sut.enqueue(5)

        XCTAssertTrue(sut.count == 1)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertNotNil(sut.peek)
    }

    func test_givenInitialized_andValueEnqueued_whenValueDequeued_thenParametersMatched_andDequeuedValueMatched() {
        var sut = makeSUT()
        sut.enqueue(5)

        let dequeuedValue = sut.dequeue()

        XCTAssertTrue(sut.count == 0)
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
        XCTAssertEqual(dequeuedValue as? Int, 5)
    }

    func test_givenInitialized_andQueueHasValues_thenPeekMatched() {
        var sut = makeSUT()
        sut.enqueue(9)
        sut.enqueue(6)

        XCTAssertEqual(sut.peek as? Int, 9)
    }
}

// MARK: - makeSUT
private extension QueueTests {
    func makeSUT() -> Queue<Any> {
        Queue()
    }
}
