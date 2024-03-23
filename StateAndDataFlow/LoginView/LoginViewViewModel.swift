//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation

// Вся логика должна быть в этом классе, выносим ее из LoginView

final class LoginViewViewModel: ObservableObject {
    
    @Published var loginDetails = User(name: "", isLoggedIn: false)
    
    var nameIsValid: Bool {
        loginDetails.name.count >= 3
    }
    
    var userNameCharCount: String {
        loginDetails.name.count.formatted()
    }
    
    private let storageManager = StorageManager.shared
    
    func login() {
        loginDetails.isLoggedIn.toggle()
        storageManager.saveUserDetails(user: loginDetails)
    }
    
    func logout() {
        loginDetails.name = ""
        loginDetails.isLoggedIn.toggle()
        storageManager.deleteUserDetails()
    }
}
