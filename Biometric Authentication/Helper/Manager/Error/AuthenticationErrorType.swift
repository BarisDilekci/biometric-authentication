//
//  AuthenticationErrorType.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import Foundation

enum AuthenticationError: LocalizedError {
    case biometricUnavailable
    case failed
    
    var errorDescription: String? {
        switch self {
        case .biometricUnavailable:
            return "Biometric verification is not available."
        case .failed:
            return "Authentication failed."
        }
    }
}
