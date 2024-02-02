//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Ethan Davis on 1/30/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var subject = 0
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Science", "Elective", "Math", "Language", "English", "History"]
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    Picker("Course", selection: $course) {
                        ForEach(Self.courses, id: \.self) { course in
                            Text(course)
                        }
                    }
                }
                .navigationBarTitle("Add New Assignment", displayMode: .inline)
                .navigationBarItems(trailing: Button("Save") {
                    if course.count > 0 && description.count > 0 {
                        let item = AssignmentItem(id: UUID(), course: course, description: description, dueDate: dueDate)
                        assignmentList.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
            }
                Image("fire")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350.0, height: 300)
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}

// .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
