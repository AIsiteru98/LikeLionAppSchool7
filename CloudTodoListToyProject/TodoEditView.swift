//
//  TodoEditView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI

struct TodoEditView: View {
    let todoListViewModel: TodoListViewModel
    @Environment(\.dismiss) private var dismiss // 추가
    typealias Priority = TODO.Priority
    
    @State private var editedTodo: TODO // 편집 중인 임시 상태

    init(todoListViewModel: TodoListViewModel, newTodo: TODO? = nil) {
        self.todoListViewModel = todoListViewModel
        self._editedTodo = State(initialValue: newTodo ?? TODO())
    }
    
    private var isEditMode: Bool {
        editedTodo.id != nil
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
                TextField("Enter Title", text: $editedTodo.title)

                Toggle("Completed", isOn: $editedTodo.isFinished)

                Picker("Priority", selection: $editedTodo.priority) {
                    ForEach(priorityOptions, id: \.self) { option in
                        Text(option.rawValue).tag(option)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

                DatePicker("Due Date", selection: $editedTodo.dueDate, displayedComponents: .date)

                TextEditor(text: $editedTodo.content)
                    .frame(minHeight: 100, maxHeight: 200) // ✅ 최소 높이 설정
                    .border(Color.gray, width: 1)
                    .padding()


                HStack {
                    Spacer()
                    Button(isEditMode ? "Save Changes" : "Add TODO") {
                        if isEditMode {
                            todoListViewModel.editTodo(editedTodo)
                        } else {
                            todoListViewModel.addTodo(editedTodo)
                        }
                        dismiss()
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
