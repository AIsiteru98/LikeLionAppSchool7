//
//  TodoEditView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI

struct TodoEditView: View {
    let todoListViewModel: TodoListViewModel
    @Binding var path: NavigationPath
    typealias Priority = TODO.Priority
    
    @State var newTodo: TODO // 네이밍 이슈
    
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
        Form {
            Section(header: Text(isEditMode ? "Edit Todo" : "Add Todo").font(.headline)) {
                TextField("Enter Title", text: $newTodo.title)

                Toggle("Completed", isOn: $newTodo.isFinished)

                Picker("Priority", selection: $newTodo.priority) {
                    ForEach(priorityOptions, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                DatePicker("Due Date", selection: $newTodo.dueDate, displayedComponents: .date)

                TextEditor(text: $newTodo.content)
                    .frame(minHeight: 100, maxHeight: 200) // ✅ 최소 높이 설정
                    .border(Color.gray, width: 1)
                    .padding()


                HStack {
                    Spacer()
                    Button(isEditMode ? "Save Changes" : "Add TODO") {
                        if isEditMode {
                           
                            todoListViewModel.editTodo(newTodo)
                        } else {
                            todoListViewModel.todos.append(newTodo)
                            todoListViewModel.addTodo(newTodo)
                        }
                        path.removeLast()
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
            }
        }
    }

}

//#Preview {
//    TodoEditView()
//}
