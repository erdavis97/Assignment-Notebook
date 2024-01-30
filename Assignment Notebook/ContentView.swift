//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Ethan Davis on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
    [AssignmentItem(course: "English", description: "Song slideshow", dueDate: Date()),
     AssignmentItem(course: "Government", description: "Test on Monday", dueDate: Date()),
     AssignmentItem(course: "Math", description: "Pages 12-14", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    Text(item.description)
                }
                .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
