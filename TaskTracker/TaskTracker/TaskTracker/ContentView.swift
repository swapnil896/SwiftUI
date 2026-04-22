//
//  ContentView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 17/04/26.
//

import SwiftUI

struct TaskModel: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var isSelectedForEdit: Bool = false
}

struct ContentView: View {
    @State private var navigateToAddTask: Bool = false
    @State private var taskList: [TaskModel] = []
    @State private var mode: TaskMode = .add
    @State private var selectedTask: TaskModel? = nil
    
    var body: some View {
        NavigationStack {
            Group {
                if taskList.isEmpty {
                    emptyStateView
                } else {
                    taskListView
                }
            }
            .navigationDestination(isPresented: $navigateToAddTask) {
                AddTaskView(taskList: $taskList, mode: $mode, selectedTask: $selectedTask)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !taskList.isEmpty {
                        Button("Add Task") {
                            mode = .add
                            navigateToAddTask = true
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var emptyStateView: some View {
        VStack {
            Text("No tasks yet!")
                .font(.headline)
                .foregroundColor(.black)
            Button("Add Task") {
                navigateToAddTask = true
            }
            .frame(width: 200)
            .padding()
            .background(Color.blue)
            .cornerRadius(6)
            .foregroundColor(.white)
        }
        .padding()
    }
    
    @ViewBuilder
    var taskListView: some View {
        List {
            ForEach(taskList) { task in
                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        deleteTask(task)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    
                    Button {
                        editTask(task)
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }
                    .tint(.blue)

                }
            }
        }
    }
    
    func deleteTask(_ task: TaskModel) {
        taskList.remove(at: taskList.firstIndex(where: {$0.id == task.id})!)
    }
    
    func editTask(_ task: TaskModel) {
        mode = .edit
        selectedTask = task
        navigateToAddTask = true
    }
}

#Preview {
    ContentView()
}
