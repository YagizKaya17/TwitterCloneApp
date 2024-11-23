//
//  SignPage.swift
//  TwitterCloneApp
//
//  Created by Yağız Kaya on 21.11.2024.
//

import SwiftUI

struct SignPage: View {
    @State var emailSign: String = ""
    @State var userName: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var IsSignUp: Bool = false
    
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .fill(LinearGradient(colors: [.purple,.blue, .green,], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea(.all)
            VStack{
                MyTextField(text: "UserName", value: $userName)
                MyTextField(text: "Email", value: $emailSign)
                MyTextField(text: "Name", value: $name)
                MySecurefield(text: "Password", value: $password)
                MyButton(text: "Sign Up") {
                    IsSignUp.toggle()               
                }
            }
            .navigationDestination(isPresented: $IsSignUp, destination: {
                LoginPage()
            })
        }
        
    }
}

#Preview {
    SignPage()
}
