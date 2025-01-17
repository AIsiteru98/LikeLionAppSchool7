//
//  ContentView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @Environment(\.modelContext) private var modelContext
    let todoListViewModel: TodoListViewModel

    var body: some View {
        
        NavigationStack {
            VStack {
                Text ("TODO LIST")
                    .font(.title)
                
                List {
                    ForEach(todoListViewModel.todos, id: \.self) { todo in
                        // 투두리스트의 항목 선택시 수정창으로 넘어감
                        NavigationLink(value: todo) {
                            TodoListCellView(todo: todo, todoListViewModel: todoListViewModel)
                        }
                    }
                    .onDelete { indexSet in
                        todoListViewModel.deleteTodo(at: indexSet)
                    }
                }
                .navigationDestination(for: TODO.self, destination: { todo in
                    TodoEditView(todoListViewModel: todoListViewModel, newTodo: todo)
                })

                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        // 단순 추가의 경우 전달되는게 따로 없음
                        NavigationLink(destination: TodoEditView(todoListViewModel: todoListViewModel)) {
                            Text ("ADD TODO")
                        }
                    }
                }
            }
        }
        
        
    }

}

//#Preview {
//    ContentView()
//        .modelContainer(for: TODO.self, inMemory: true)
//}
