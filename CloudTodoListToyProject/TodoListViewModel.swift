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
        modelContext.insert(todo)
       // fetchTodos() // 변경된 데이터 반영
    }
    
    /// 기존에 존재하는 TODO 변경
       func editTodo(_ todo: TODO) {
           if let index = todos.firstIndex(where: { $0.id == todo.id }) {
               todos[index] = todo
               saveTodo() // 변경사항 저장
           } else {
               print("Error: Cannot find TODO to edit")
           }
       }
    
    /// TODO 삭제
    func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(todos[index])
        }
       // saveTodo()
    }
    /// TODO 저장
    func saveTodo() {
            do {
                try modelContext.save() // SwiftData에 저장
                fetchTodos() // ✅ 변경된 데이터 반영
            } catch {
                print("Failed to save TODOs: \(error)")
            }
        }
}
