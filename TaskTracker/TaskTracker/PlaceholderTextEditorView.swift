//
//  PlaceholderTextEditorView.swift
//  TaskTracker
//
//  Created by Swapnil Magar on 20/04/26.
//

import SwiftUI

struct PlaceholderTextEditorView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.top, 12)
                    .padding(.leading, 8)
                    .allowsHitTesting(false)
            }
        }
    }
}

#Preview {
    PlaceholderTextEditorView(text: .constant("Description Text"), placeholder: "Enter your Description")
}
