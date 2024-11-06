//
//  AuthenticationViewModel.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import SwiftUI

@MainActor
class AuthenticationViewModel: ObservableObject {
    
    static let shared = AuthenticationViewModel()
    
    @Published var isAuthenticated = false
    @Published var showAlert = false
    @Published var alertMessage = "Authentication error"
    
    private let authenticationManager: AuthenticationManagerProtocol
    
    private init(authenticationManager: AuthenticationManagerProtocol = AuthenticationManager()) {
        self.authenticationManager = authenticationManager
    }
    
    func authenticate() async {
        do {
            let success = try await authenticationManager.authenticate()
            isAuthenticated = success
            
        } catch let error as AuthenticationError {
            alertMessage = error.localizedDescription
            showAlert = true
            
        } catch {
            alertMessage = "An unexpected error occurred."
            showAlert = true
        }
    }
}
