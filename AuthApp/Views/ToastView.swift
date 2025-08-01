//
//  ToastView.swift
//  AuthApp
//
//  Created by Mikaila Akeredolu on 7/14/25.
//

import SwiftUI

struct ToastView: View {
    
    let message: String
    
    var body: some View {
        
        Text(message)
            .font(.caption)
            .foregroundStyle(.white)
            .padding()
            .background(Color.black.opacity(0.9))
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

#Preview {
    ToastView(message: "toast message")
}
