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
    
    @AppStorage("username") var username = ""
   
    private init() {}
    
    func save(name: String) {
       username = name
        print("saved")
    }
    
    func getSavedName() -> String {
        return username
    }
    
    func deleteName() {
        username = ""
    }
    
}
