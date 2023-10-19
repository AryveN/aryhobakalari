//
//  MainScreen.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 13.09.2022.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        LogoImage()
        NameAuthor()
        Text("Beta")
            .font(.subheadline)
        
        Text("Úspěšně přihlášeno.");
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
