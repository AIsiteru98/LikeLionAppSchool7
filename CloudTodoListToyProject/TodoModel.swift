//
//  Item.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import Foundation
import SwiftData

/*
 Todo 항목 설정
 1. 생성일 (createdDate)
 2. 실행일 (dueDate)
 3. 타이틀 (title)
 4. 내용 (content)
 5. 완료 여부 (isFinished)
 6. 우선순위 (priority)
 6-1. 매우 시급
 6-2. 시급
 6-3. 보통
 6-4. 여유 있음
 6-5. 필수 아님
 7. 카테고리 (category)
 
 */

@Model
final class TODO {
    static let defaultTodo = TODO(
        createdDate: Date(),
        dueDate: Date(),
        title: "",
        content: "",
        isFinished: false,
        priority: 1,
        category: "none"
    )
    
    var createdDate: Date
    var dueDate: Date
    var title: String
    var content: String
    var isFinished: Bool
    var priority: Int // 1~5
    var category: String
    
    init (
        createdDate: Date,
        dueDate: Date,
        title: String,
        content: String,
        isFinished: Bool,
        priority: Int,
        category: String
    ) {
        self.createdDate = createdDate
        self.dueDate = dueDate
        self.title = title
        self.content = content
        self.title = title
        self.isFinished = isFinished
        self.priority = priority
        self.category = category
    }
}
