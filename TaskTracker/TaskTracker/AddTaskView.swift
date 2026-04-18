//
//  AddTaskView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 18/04/26.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Title")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                    TextField("Enter task title", text: $title)
                }
                VStack {
                    Text("Description")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                    TextEditor(text: $description)
                        .border(.black, width: 1)
                }
                Button("Save") {
                    
                }
                .padding()
                .frame(width: 280)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle("Add your Task")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AddTaskView()
}
