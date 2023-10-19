//
//  ContentView.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 09.09.2022.
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var loginView = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        return Group {
            if loginView {
                LoginScreen()
            } else {
                VStack {
                    
                    LogoImage()
                    NameAuthor()
                    Spacer()
                        .frame(height: 30)
                    Button("Přihlásit se") {
                        loginView = true
                    }
                    .padding()
                    .border(colorScheme == .dark ? Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5) : Color(red: 0.949, green: 0.714, blue: 0.984), width: 3)
                    .background(Color(red: 0.983, green: 0.531, blue: 1.0))
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
