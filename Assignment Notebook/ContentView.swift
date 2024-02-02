//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Ethan Davis on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    @State private var active = true
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove { indices, newOffset in
                    assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentList.items.remove(atOffsets: indexSet)
                }
                .background(Color(red: red, green: green, blue: blue)
                    .opacity(0.5))
                .cornerRadius(5.0)
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentList: assignmentList)
            })
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAddAssignmentView = true
                randomColor()
            }) {
                    Image(systemName: "plus")
                })
        }
    }
    func randomColor() {
        red = Double.random(in: 0.1...1.0)
        green = Double.random(in: 0.1...1.0)
        blue = Double.random(in: 0.1...1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
