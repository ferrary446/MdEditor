//
//  ITaskManager+.swift
//  TodoList
//
//  Created by Kirill Leonov on 20.02.2023.
//

// swiftlint:disable missing_docs
public protocol ITaskManager {
	func allTasks() -> [Task]
	func completedTasks() -> [Task]
	func uncompletedTasks() -> [Task]
	func addTask(task: Task)
	func addTasks(tasks: [Task])
    func removeTask(task: Task)
}
// swiftlint:enable missing_docs

extension TaskManager: ITaskManager {}
