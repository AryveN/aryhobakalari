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
    @State private var login: Bool = false
    @State private var error: Bool = false
    @State private var isLoading: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        return Group {
            VStack {
                
                if (error == true) {
                    Text("Nastala chyba při přihlašování!")
                        .foregroundColor(Color.red)
                }
                Spacer()
                    .frame(height: 20)
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
                    isLoading.toggle()
                    firstLogin(username: username, password: password) {success in
                        if success {
                            print("Login successful")
                            login = true
                            isLoading.toggle()
                        } else {
                            print("Login failed")
                            error = true
                            isLoading.toggle()
                        }
                    }
                }
                .frame(width: 100)
                .padding()
                .border(colorScheme == .dark ? Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5) : Color(red: 0.949, green: 0.714, blue: 0.984), width: 3)
                .background(Color(red: 0.983, green: 0.531, blue: 1.0))
                .foregroundColor(.black)
                Spacer()
                    .frame(height: 20)
                if isLoading {
                    ProgressView("Přihlašování...")
                }
            }
            .fullScreenCover(isPresented: $login) {
                MainScreen()
            }
        }
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
