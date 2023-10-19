//
//  LoginForm.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 10.09.2022.
//

import SwiftUI

struct LoginForm: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var login = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        return Group {
            if login {
                //MainScreen()
            } else {
                VStack {
                    TextField(
                        "Uživatelské jméno",
                        text: $username
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .frame(width: 250)
                    SecureField(
                        "Heslo",
                        text: $password
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .frame(width: 250)
                    
                    Spacer()
                        .frame(height: 12)
                    Button("Přihlásit se") {
                        firstLogin(username: username, password: password) {success in
                            if success {
                                print("Login successful")
                                login = true
                            } else {
                                print("Login failed")
                            }
                        }
                    }
                    .frame(width: 100)
                    .padding()
                    .border(colorScheme == .dark ? Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5) : Color(red: 0.949, green: 0.714, blue: 0.984), width: 3)
                    .background(Color(red: 0.983, green: 0.531, blue: 1.0))
                    .foregroundColor(.black)
                    
                    NavigationLink(destination: MainScreen(), isActive: $login) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
