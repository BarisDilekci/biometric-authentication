//
//  MockAuthenticationManager.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import Foundation

final class MockAuthenticationManager : AuthenticationManagerProtocol {
    var shouldSucceed: Bool = false
    
    init(shouldSucceed: Bool) {
        self.shouldSucceed = shouldSucceed
    }
    
    func authenticate() async throws -> Bool {
          if shouldSucceed {
              return true
          } else {
              throw AuthenticationError.failed
          }
      }
}
