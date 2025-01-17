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
        
        NavigationStack {
            VStack {
                Text ("TODO LIST")
                    .font(.title)
                
                HStack {
                    Spacer()
                    
                    NavigationLink("ADD") {
                        Text ("ADD TODO")
                    }

                
                }
                List {
                    
                }
            }
        }
        .navigationDestination(for: String.self) { _ in
            TodoEditView()
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
                modelContext.delete(todos[index])
            }
        }
    }
    private func editItems(offsets: IndexSet) {
        
    }
    

}

//#Preview {
//    ContentView()
//        .modelContainer(for: TODO.self, inMemory: true)
//}
