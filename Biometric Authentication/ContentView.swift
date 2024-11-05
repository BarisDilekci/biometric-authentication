//
//  ContentView.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import SwiftUI
import LocalAuthentication


struct ContentView: View {
    @State private var isAuthenticated = false
    @State private var showAlert = false
    @State private var alertMessage = "Authentication error"
    
    var body: some View {
        NavigationStack {
            if isAuthenticated {
                Text("Welcome")
                    .font(.headline)
                    .padding()
            } else {
                Text("Authenticate to continue")
                    .font(.headline)
                    .padding()
                
                Button {
                    Task{
                        await authenticate()
                    }
                } label: {
                    Text("Authenticate")
                        .font(.title)
                        .bold()
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .navigationTitle("Biometric Authentication")
        .alert("Authentication failed", isPresented: $showAlert) {
            Button("OK") {
                //
            }
        } message: {
            Text(alertMessage)
        }
    }
    
    func authenticate() async {
        let context = LAContext()
        var error : NSError?
         if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
             do {
                 let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Log in to your account")

                 if success {
                     isAuthenticated = true
                 }
                 
             } catch {
                 alertMessage = error.localizedDescription
             }
             
         } else {
             alertMessage = "Biometric verification is not available"
                        showAlert = true
         }
    }
}

#Preview {
    ContentView()
}
