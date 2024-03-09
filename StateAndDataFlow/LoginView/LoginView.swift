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
                Text(loginViewVM.loginDetails.name.count.formatted())
                    .foregroundStyle(
                        loginViewVM.loginDetails.name.count < 3 ? .red : .green
                    )
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing, 30)
            }
            .multilineTextAlignment(.center)
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                    .disabled(loginViewVM.loginDetails.name.count < 3)
            }
        }
    }
    
    private func login() {
        if loginViewVM.loginDetails.name.count >= 3  {
            loginViewVM.loginDetails.isLoggedIn.toggle()
            storageManager.saveUserDetails(user: loginViewVM.loginDetails)
        }
    }
    
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
