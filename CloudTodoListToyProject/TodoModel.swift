//
//  Item.swift
//  CloudTodoListToyProject
//
//  Created by 이재용 on 1/17/25.
//

import Foundation
import SwiftData
import SwiftUICore

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
class TODO: Equatable, Identifiable, Hashable {
    enum Priority: String, Codable {
        case veryHigh = "Very High"
        case high = "High"
        case normal = "Normal"
        case low = "Low"
        case notImportant = "Not Important"
        
        func urgencyColor() -> Color {
            switch self {
            case .veryHigh: return .red
            case .high: return .orange
            case .normal: return .yellow
            case .low: return .green
            case .notImportant: return .blue
            }
        }
    }
    
    var id: UUID? = nil
    var createdDate: Date = Date()
    var dueDate: Date = Date()
    var title: String = "title"
    var content: String = "title"
    var isFinished: Bool = false
    var priority: Priority = Priority.normal
    var category: String = "none"
    
    init() {}
        
    init (
        createdDate: Date,
        dueDate: Date,
        title: String,
        content: String,
        isFinished: Bool,
        priority: Priority,
        category: String
    ) {
        self.createdDate = createdDate
        self.dueDate = dueDate
        self.title = title
        self.content = content
        self.isFinished = isFinished
        self.priority = priority
        self.category = category
    }
}
