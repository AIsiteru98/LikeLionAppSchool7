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
    @Query private var todos: [TODO]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        Text("Item at \(todo.createDate, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(todo.createdDate, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = TODO.defaultTodo
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    private func editItems(offsets: IndexSet) {
        
    }
    

}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
