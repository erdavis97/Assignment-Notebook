//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Ethan Davis on 1/30/24.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "English", description: "Song slideshow", dueDate: Date()),
                            AssignmentItem(course: "Government", description: "Test on Monday", dueDate: Date()),
                            AssignmentItem(course: "Math", description: "Pages 12-14", dueDate: Date())]
}
