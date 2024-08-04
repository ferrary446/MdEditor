@testable import TaskManagerPackage
import XCTest

final class OrderedTaskManagerTests: XCTestCase {
    func test_givenInitialized_andTaskListHasTasks_thenTasksCountMatched_andTasksSortingMatched() {
        let sut = makeSUT(
            taskList: [
                ImportantTask.makeMock(taskPriority: .low),
                ImportantTask.makeMock(taskPriority: .medium),
                ImportantTask.makeMock(taskPriority: .high),
                RegularTask(title: "Completed task", isComplete: true),
                RegularTask(title: "Uncompleted task", isComplete: false)
            ]
        )

        XCTAssertTrue(sut.allTasks().count == 5)
        XCTAssertEqual(sut.allTasks()[0].title, "High important task")
        XCTAssertEqual(sut.allTasks()[1].title, "Medium important task")
        XCTAssertEqual(sut.allTasks()[2].title, "Low important task")
        XCTAssertEqual(sut.allTasks()[3].title, "Uncompleted task")
        XCTAssertFalse(sut.allTasks()[3].isComplete)
        XCTAssertEqual(sut.allTasks()[4].title, "Completed task")
        XCTAssertTrue(sut.allTasks()[4].isComplete)
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
private extension OrderedTaskManagerTests {
    func makeSUT(taskList: [Task] = []) -> some ITaskManager {
        OrderedTaskManager(
            taskManager: TaskManager(taskList: taskList)
        )
    }
}
