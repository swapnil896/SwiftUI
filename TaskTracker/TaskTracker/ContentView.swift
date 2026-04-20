//
//  ContentView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToAddTask: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
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
            .navigationDestination(isPresented: $navigateToAddTask) {
                AddTaskView()
            }
        }
    }
}

#Preview {
    ContentView()
}
