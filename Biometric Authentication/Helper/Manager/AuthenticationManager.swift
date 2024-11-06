//
//  AuthenticationManager.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import Foundation
import LocalAuthentication

protocol AuthenticationManagerProtocol {
    func authenticate() async throws -> Bool
}

final class AuthenticationManager: AuthenticationManagerProtocol {
    func authenticate() async throws -> Bool {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            throw AuthenticationError.biometricUnavailable
        }
        
        let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Log in to your account")
        
        return success
    }
}
