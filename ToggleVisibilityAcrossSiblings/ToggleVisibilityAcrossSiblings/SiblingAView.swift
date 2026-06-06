//
//  SiblingAView.swift
//  ToggleVisibilityAcrossSiblings
//
//  Created by Swapnil Magar on 06/06/26.
//

import SwiftUI

struct SiblingAView: View {
    @Binding var isBVisible: Bool
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                Text("View A")
                    .foregroundColor(.white)
                    .font(.headline)
            }
            Button("Toggle B") {
                isBVisible.toggle()
            }
        }
    }
}

#Preview {
    SiblingAView(isBVisible: .constant(true))
}
