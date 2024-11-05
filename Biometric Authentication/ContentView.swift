//
//  ContentView.swift
//  Biometric Authentication
//
//  Created by Barış Dilekçi on 6.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.isAuthenticated {
                Text("Welcome")
                    .font(.headline)
                    .padding()
            } else {
                Text("Authenticate to continue")
                    .font(.headline)
                    .padding()
                
                Button {
                    Task {
                        await viewModel.authenticate()
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
        .alert("Authentication failed", isPresented: $viewModel.showAlert) {
            Button("OK") { }
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    ContentView()
}
