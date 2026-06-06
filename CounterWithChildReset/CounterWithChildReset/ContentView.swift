//
//  ContentView.swift
//  CounterWithChildReset
//
//  Created by Swapnil Magar on 06/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
            CounterView(count: $count)
            Button("Reset") {
                count = 0
            }
        }
    }
}

#Preview {
    ContentView()
}
