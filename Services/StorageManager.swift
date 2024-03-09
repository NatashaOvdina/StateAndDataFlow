//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Natalia Ovdina on 09.03.2024.
//

import Foundation
import SwiftUI

final class StorageManager {
    @AppStorage("userDetails") var userDetails: Data?
    
    static let shared = StorageManager()
    
    private init() {}
    
    func saveUserDetails(user: User) {
        guard let data = try? JSONEncoder().encode(user) else { return }
        userDetails = data
    }
    
    func loadUserDetails() -> User? {
        guard let data = userDetails else { return nil}
        guard let decodeDetails = try? JSONDecoder().decode(User.self, from: data) else { return nil}
        return decodeDetails
    }
    
    func deleteUserDetails() {
        userDetails = nil
    }
}
