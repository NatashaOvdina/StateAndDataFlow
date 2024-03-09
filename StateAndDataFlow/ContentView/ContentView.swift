//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.loginDetails.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(text: contentViewVM.buttonTitle, color: .red) {
                contentViewVM.startTimer()
            }
            
            Spacer()
            
            ButtonView(text: "Log out", color: .blue) {
                logOut()
            }
            .padding(.bottom, 40)
        }
    }
    
    private func logOut() {
        loginViewVM.loginDetails.isLoggedIn.toggle()
        loginViewVM.loginDetails.name = ""
        storageManager.deleteUserDetails()
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

