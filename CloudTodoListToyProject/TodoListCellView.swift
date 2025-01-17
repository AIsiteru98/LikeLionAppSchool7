//
//  TodoListCellView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI

struct TodoListCellView: View {
    var todo: TODO
    let todoListViewModel: TodoListViewModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: todo.isFinished ? "checkmark.square.fill" : "checkmark.square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.green)
                .onTapGesture {
                    todo.isFinished.toggle()
                    todoListViewModel.editTodo(todo)
                }
            VStack(alignment: .leading) {
                HStack {
                    Text(todo.title)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text(todo.priority.rawValue)
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal,8)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(todo.priority.urgencyColor())
                                
                        )
                        .padding(.trailing,10)
                }
                
                
                Text(todo.content)
                    .lineLimit(2)
                
                Text(todo.dueDate, style: .date) // ✅ 날짜 스타일 개선
                
                
            }
            .padding(.leading)
        }
        .padding()
        
        .frame(maxWidth: .infinity, maxHeight: 150)
    }
}
//
//#Preview {
//    TodoListCellView.init(todo: TODO(createdDate: Date(), dueDate: Date(), title: "축구경기", content: "맨유 vs 리버풀 브루노페르난데스 선발", isFinished: false, priority: .veryHigh, category: "none"))
//}
