//
//  ContentView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Add Task") {
                addTask()
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(6)
            .foregroundColor(.white)
            
        }
        .padding()
    }
    
    func addTask() {
        print("Add Task")
    }
}

#Preview {
    ContentView()
}
