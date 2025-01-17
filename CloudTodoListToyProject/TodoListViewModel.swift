//
//  TodoListViewModel.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI
import SwiftData

@Observable
class TodoListViewModel {
    private var modelContext: ModelContext
    var todos: [TODO] = []
    
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchTodos()
    }
    
    /// SwiftData에서 TODO 리스트 가져오기
    func fetchTodos() {
        do {
            let fetchDescriptor = FetchDescriptor<TODO>()
            self.todos = try modelContext.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch TODOs: \(error)")
        }
    }
    
    /// 새로운 TODO 추가
    ///
    /// fetchTodos 필요없음 insertrk
    func addTodo(_ todo: TODO) {
        todo.id = UUID()
        modelContext.insert(todo)
        saveTodo()
        fetchTodos()
    }
    
    func editTodo(_ todo: TODO) {
        // SwiftData는 참조 타입이므로 자동으로 변경사항이 추적됨
        saveTodo()
        fetchTodos() // UI 업데이트를 위해 필요
    }
    
    func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
        saveTodo()
        fetchTodos() // UI 업데이트를 위해 필요
    }
    
    func saveTodo() {
        do {
            try modelContext.save() // SwiftData에 저장
            fetchTodos() // ✅ 변경된 데이터 반영
        } catch {
            print("Failed to save TODOs: \(error)")
        }
    }
}
