//
//  MainScreen.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 13.09.2022.
//

import SwiftUI

struct MainScreen: View {
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
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
