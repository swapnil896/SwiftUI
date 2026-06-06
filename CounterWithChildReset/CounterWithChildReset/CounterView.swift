//
//  CounterView.swift
//  CounterWithChildReset
//
//  Created by Swapnil Magar on 06/06/26.
//

import SwiftUI

struct CounterView: View {
    @Binding var count: Int
    var body: some View {
        VStack {
            Text("\(count)")
            Button("Increment") {
                count += 1
            }
        }
    }
}

#Preview {
    CounterView(count: .constant(0))
}
