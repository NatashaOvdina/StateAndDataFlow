//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Enter your name", text: $loginViewVM.loginDetails.name)
                    .padding(.leading, 30)
                Text(loginViewVM.userNameCharCount)
                    .foregroundStyle(
                        loginViewVM.nameIsValid ? .green : .red
                    )
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 30)
            }
            .multilineTextAlignment(.center)
            
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.nameIsValid)
        }
    }
    
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
