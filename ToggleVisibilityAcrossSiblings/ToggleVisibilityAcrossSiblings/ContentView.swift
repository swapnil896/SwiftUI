//
//  ContentView.swift
//  ToggleVisibilityAcrossSiblings
//
//  Created by Swapnil Magar on 06/06/26.
//

/*
 Create a parent with two sibling views. A button in sibling A should toggle the visibility of sibling B. Neither sibling may hold @State.
 */

import SwiftUI

struct ContentView: View {
    @State private var isSiblingBVisible: Bool = true
    var body: some View {
        HStack(alignment: .top, spacing: 60) {
            SiblingAView(isBVisible: $isSiblingBVisible)
            if isSiblingBVisible {
                SiblingBView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
