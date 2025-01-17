//
//  TodoEditView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI

struct TodoEditView: View {
    typealias Priority = TODO.Priority
    @State private var newTodo: TODO = TODO.defaultTodo
    private var isEditMode: Bool { // 에딧모드인지에 따라서 뷰를 다르게 호출
        if newTodo == TODO.defaultTodo {
            return false
        } else {
            return true
        }
    }
    private let priorityDict: [Priority : Int] = [.veryHigh: 5,
                                                  .high:4,
                                                  .normal: 3,
                                                  .low: 2,
                                                  .notImportant: 1]
    
    private let priorityOptions = [Priority.veryHigh, Priority.high, Priority.normal, Priority.low, Priority.notImportant]
    /*
     var createdDate: Date
     var dueDate: Date
     var title: String
     var content: String
     var isFinished: Bool
     var priority: Int // 1~5
     var category: String
     
     1. 생성일 -> 자동생성
     2. 듀데이 -> 입력, 날짜 픽커
     3. 타이틀 -> 텍스트필드d
     4. 컨텐츠 -> 텍스트에디터
     5. isFinished -> 토글
     6. 우선순위 -> 드롭다운
     */
    var body: some View {
        VStack(alignment: .leading) {
            isEditMode ? Text("Todo Edit View") : Text("Todo Add View")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack {
                Text("Title: ")
                
                TextField("Enter Title of Todo", text: $newTodo.title)
            }
            
            HStack {
                
                Toggle("Is Finished? ", isOn: $newTodo.isFinished)
                    .padding(.trailing)
                Menu {
                    ForEach(priorityOptions, id: \.self) { option in
                        Button {
                            newTodo.priority = option
                        } label: {
                            Text(option.rawValue)
                        }

                    }
                } label: {
                    Text("Urgency: ")
                        .backgroundStyle(newTodo.priority.urgencyColor())
                }
                
                
                
                Picker("Priority", selection: $newTodo.priority) {
                    ForEach(priorityOptions, id: \.self) { priorityOption in
                        Text(priorityOption.rawValue)
                        
                    }
                }
                
            }
            
            
            HStack {
                Text("Due Date: ")
                
                TextField("Enter Title of Todo", text: $newTodo.title)
            }
            
                Text("Content")
                
                TextEditor(text: $newTodo.content)
                .border(.gray)
                .frame(maxHeight: 150)
                .padding()
            
            
            
            
            
        }
    }
}

//#Preview {
//    TodoEditView()
//}
