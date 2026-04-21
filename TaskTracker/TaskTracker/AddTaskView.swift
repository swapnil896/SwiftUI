//
//  AddTaskView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 18/04/26.
//

import SwiftUI

enum TaskMode {
    case add, edit
}

struct AddTaskView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @Binding var taskList: [TaskModel]
    @Binding var mode: TaskMode
    @Binding var selectedTask: TaskModel?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack() {
            VStack {
                Text("Title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                TextField("Enter task title", text: getTitleText())
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
                PlaceholderTextEditorView(text: getDescriptionText(), placeholder: "Enter your Description here")
                    .frame(height: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke()
                    )
            }
            .padding()
            Spacer(minLength: 10)
            Button("Save" + (mode == .edit ? " changes" : "")) {
                saveTask()
                dismiss()
                
            }
            .padding()
            .frame(width: 280)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .navigationTitle("Add your Task")
        }
    }
    
    func getTitleText() -> Binding<String> {
        switch mode {
        case .add:
            return $title
        case .edit:
            return Binding(
                get: { selectedTask?.title ?? "" },
                set: { selectedTask?.title = $0 }
            )
        }
    }
    
    func getDescriptionText() -> Binding<String> {
        switch mode {
        case .add:
            return $description
        case .edit:
            return Binding {
                selectedTask?.description ?? ""
            } set: { newVal in
                selectedTask?.description = newVal
            }
        }
    }
    
    func saveTask() {
        if title.isEmpty {
            // show alert
            return
        }
        switch mode {
        case .add:
            let newTask = TaskModel(title: title, description: description)
            taskList.append(newTask)
        case .edit:
            if var task = selectedTask {
                task.title = title
                task.description = description
                if let index = taskList.firstIndex(where: { $0.id == task.id }) {
                    taskList[index] = task
                    selectedTask = task
                }
            }
        }
    }
}

