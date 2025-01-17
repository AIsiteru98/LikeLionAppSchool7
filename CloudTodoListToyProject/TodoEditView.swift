//
//  TodoEditView.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import SwiftUI

struct TodoEditView: View {
    @State private var newTodo: TODO = TODO.defaultTodo
    private var isEditMode: Bool { // 에딧모드인지에 따라서 뷰를 다르게 호출
        if newTodo == TODO.defaultTodo {
            return false
        } else {
            return true
        }
    }
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
     3. 타이틀 -> 텍스트필드d     4. 컨텐츠 -> 텍스트에디터
     5. isFinished -> 토글
     6. 우선순위 -> 드롭다운
     
     
     
     */
    var body: some View {
        VStack {
            isEditMode ? Text("Todo Edit View") : Text("Todo Add View")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
        }
    }
}

//#Preview {
//    TodoEditView()
//}
