//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Natalia Ovdina on 09.03.2024.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

#Preview {
    ButtonView(text: "Go", color: .red, action: {})
}
