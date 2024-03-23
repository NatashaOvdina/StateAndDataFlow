//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let contentViewVM = ContentViewViewModel()
    
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
            
            ButtonView(
                text: contentViewVM.buttonTitle,
                color: .red,
                action: contentViewVM.startTimer
            )
            
            Spacer()
            
            ButtonView(
                text: "Log out",
                color: .blue,
                action: loginViewVM.logout
            )
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    ContentView()
        .environmentObject(LoginViewViewModel())
}

