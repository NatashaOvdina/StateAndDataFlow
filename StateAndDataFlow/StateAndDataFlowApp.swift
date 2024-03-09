//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var contentViewVM = ContentViewViewModel()
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    private let storageManager = StorageManager.shared
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear {
                    guard let user = storageManager.loadUserDetails() else { return }
                    loginViewVM.loginDetails = user
                }
        }
        .environmentObject(contentViewVM)
        .environmentObject(loginViewVM)
    }
        
}
