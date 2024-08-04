@testable import TaskManagerPackage
import XCTest

final class TaskManagerTests: XCTestCase {
    func test_givenInitialized_andTaskListHasTasks_thenTasksCountMatched() {
        let sut = makeSUT(taskList: [.makeMock(), .makeMock(), .makeMock()])

        XCTAssertTrue(sut.allTasks().count == 3)
    }

    func test_givenInitialized_andTaskListHasCompletedTasks_thenTasksCountMatched() {
        let sut = makeSUT(taskList: [.makeMock(isComplete: true), .makeMock(), .makeMock()])

        XCTAssertTrue(sut.completedTasks().count == 1)
    }

    func test_givenInitialized_andTaskListHasUncompletedTasks_thenTasksCountMatched() {
        let sut = makeSUT(taskList: [.makeMock(isComplete: true), .makeMock(isComplete: true), .makeMock()])
        
        XCTAssertTrue(sut.uncompletedTasks().count == 1)
    }

    func test_givenInitialized_andTasksCountIsThree_whenUserAddNewTask_thenTasksCountIncreased() {
        let sut = makeSUT(taskList: [.makeMock(), .makeMock(), .makeMock()])

        sut.addTask(task: .makeMock())

        XCTAssertTrue(sut.allTasks().count == 4)
    }

    func test_givenInitialized_andTaskListIsEmpty_whenUserAddNewTasks_thenTaskListHasTasks() {
        let sut = makeSUT()

        sut.addTasks(
            tasks: [
                .makeMock(title: "NewTask"),
                .makeMock(title: "Completed New Task", isComplete: true)
            ]
        )

        XCTAssertTrue(sut.allTasks().count == 2)
    }

    func test_givenInitialized_andTaskListHasTask_whenUserRemoveTask_thenTasksCountDecreased() {
        let taskForRemove = Task(title: "Title", isComplete: false)
        let sut = makeSUT(taskList: [taskForRemove])

        sut.removeTask(task: taskForRemove)

        XCTAssertEqual(sut.allTasks().count, 0)
    }
}

// MARK: - makeSUT
private extension TaskManagerTests {
    func makeSUT(taskList: [Task] = []) -> some ITaskManager {
        TaskManager(
            taskList: taskList
        )
    }
}
