//
//  LoginScreen.swift
//  aryhobakalari
//
//  Created by Krystof Hugo Maly on 10.09.2022.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        VStack {
            LogoImage();
            NameAuthor();
            Spacer()
                .frame(height: 30)
            LoginForm();
        }
    
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
