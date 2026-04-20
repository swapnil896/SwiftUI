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
        VStack() {
            VStack {
                Text("Title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                TextField("Enter task title", text: $title)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke()
                    )
            }
            .padding()
            VStack {
                Text("Description")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                PlaceholderTextEditorView(text: $description, placeholder: "Enter your Description here")
                    .frame(height: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke()
                    )
            }
            .padding()
            Spacer(minLength: 10)
            Button("Save") {
                
            }
            .padding()
            .frame(width: 280)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .navigationTitle("Add your Task")
        }
    }
}

#Preview {
    AddTaskView()
}

