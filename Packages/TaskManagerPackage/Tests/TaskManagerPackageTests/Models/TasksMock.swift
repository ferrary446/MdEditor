import TaskManagerPackage

extension Task {
    static func makeMock(
        title: String = "title",
        isComplete: Bool = false
    ) -> Task {
        Task(title: title, isComplete: isComplete)
    }
}

extension ImportantTask {
    static func makeMock(taskPriority: TaskPriority) -> ImportantTask {
        let title: String = {
            switch taskPriority {
            case .low:
                "Low important task"
            case .medium:
                "Medium important task"
            case .high:
                "High important task"
            }
        }()

        return ImportantTask(title: title, taskPriority: taskPriority)
    }
}
