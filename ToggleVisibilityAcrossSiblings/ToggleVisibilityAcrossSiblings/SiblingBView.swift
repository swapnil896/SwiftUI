//
//  SiblingBView.swift
//  ToggleVisibilityAcrossSiblings
//
//  Created by Swapnil Magar on 06/06/26.
//

import SwiftUI

struct SiblingBView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
                Text("View B")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    SiblingBView()
}
