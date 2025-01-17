//
//  CloudTodoListToyProjectApp.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI
import SwiftData

@main
struct CloudTodoListToyProjectApp: App {
    private let sharedModelContainer: ModelContainer
    private let todoListViewModel: TodoListViewModel

    init() {
        let schema = Schema([TODO.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            let modelContext = sharedModelContainer.mainContext
            todoListViewModel = TodoListViewModel(modelContext: modelContext)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView(todoListViewModel: todoListViewModel)
        }
        .modelContainer(sharedModelContainer)
    }
}
