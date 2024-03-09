//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Natalia Ovdina on 09.03.2024.
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("userDetails") var userDetails: Data?
   
    private init() {}
    
    func saveUserDetails(user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDetails = data
    }
    
    func loadUserDetails() -> User? {
        guard let data = userDetails else { return User(name: "", isLoggedIn: false)}
        guard let decoderedDetails = try? JSONDecoder().decode(User.self, from: data) else { return User(name: "", isLoggedIn: false)}
        return decoderedDetails
    }
    
    func deleteUserDetails() {
        userDetails = nil
    }
}
