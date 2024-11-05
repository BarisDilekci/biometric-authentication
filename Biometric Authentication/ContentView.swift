//
//  ContentView.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import SwiftUI

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
                    //
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
}

#Preview {
    ContentView()
}
