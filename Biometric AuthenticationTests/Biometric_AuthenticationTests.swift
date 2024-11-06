//
//  Biometric_AuthenticationTests.swift
//  Biometric AuthenticationTests
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import XCTest
@testable import Biometric_Authentication

final class Biometric_AuthenticationTests: XCTestCase {

    func testAuthenticateSuccess() async throws {
            let mockAuthenticationManager = MockAuthenticationManager(shouldSucceed: true)
            
            do {
                let result = try await mockAuthenticationManager.authenticate()
                XCTAssertTrue(result, "Authentication should succeed but returned false.")
            } catch {
                XCTFail("Authentication failed unexpectedly: \(error)")
            }
        }
        
        func testAuthenticateFailure() async throws {
            let mockAuthenticationManager = MockAuthenticationManager(shouldSucceed: false)
            
            do {
                _ = try await mockAuthenticationManager.authenticate()
                XCTFail("Authentication should fail but succeeded unexpectedly.")
            } catch let error as AuthenticationError {
                XCTAssertEqual(error, .failed, "Expected .failed error, but got \(error).")
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
        }

}
