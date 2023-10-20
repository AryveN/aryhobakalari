//
//  MainScreen.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 13.09.2022.
//

import SwiftUI
struct MainScreen: View {
    @State private var logout: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            LogoImage()
            NameAuthor()
            Spacer()
                .frame(height: 20)
            Text("Beta")
                .font(.subheadline)
            Spacer()
                .frame(height: 50)
            Text("Úspěšně přihlášeno.");
            Spacer()
                .frame(height: 50)
            Button("Odhlásit se") {
                logout.toggle()
            }
            .frame(width: 100)
            .padding()
            .border(colorScheme == .dark ? Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.5) : Color(red: 0.949, green: 0.714, blue: 0.984), width: 3)
            .background(Color(red: 0.983, green: 0.531, blue: 1.0))
            .foregroundColor(.black)
        }
        .fullScreenCover(isPresented: $logout) {
            ContentView();
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
