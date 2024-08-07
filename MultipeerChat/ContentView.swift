//
//  ContentView.swift
//  MultipeerChat
//
//  Created by ARMBP on 8/7/24.
//

import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @StateObject private var multipeerManager = MultipeerManager()
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            Text("Status: \(multipeerManager.connectionStatus)")
                .padding()
            
            List(multipeerManager.receivedMessages, id: \.self) { message in
                Text(message)
            }
            
            HStack {
                TextField("Enter message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    multipeerManager.send(message: messageText)
                    messageText = ""
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
