//
//  AuthenticationViewModel.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import SwiftUI
import LocalAuthentication

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var showAlert = false
    @Published var alertMessage = "Authentication error"
    
    func authenticate() async {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Log in to your account")
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.alertMessage = error.localizedDescription
                    self.showAlert = true
                }
            }
            
        } else {
            DispatchQueue.main.async {
                self.alertMessage = "Biometric verification is not available"
                self.showAlert = true
            }
        }
    }
}
