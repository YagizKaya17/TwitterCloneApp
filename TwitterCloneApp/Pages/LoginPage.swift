//
//  LoginPage.swift
//  TwitterCloneApp
//
//  Created by Yağız Kaya on 21.11.2024.
//

import SwiftUI

struct LoginPage: View {
    
    @State var emailValue: String = ""
    @State var passwordValue: String = ""
    
    @State var IsLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                ContainerRelativeShape()
                    .fill(LinearGradient(colors: [.purple,.blue, .green,], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea(.all)
                VStack{
                    MyLoginTextFields(emailValue: $emailValue, passwordValue: $passwordValue)
                    //Spacer
                    Spacer()
                        .frame(height: 20)
                    //Navigations
                    HStack {
                        Spacer()
                        //Sign Up Navigaton
                        NavigationLink(destination: SignPage(), label: {
                            Text("Sign Up")
                                .font(.subheadline)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding()
                                .foregroundColor(.black)
                                .cornerRadius(20)
                        })
                        MyButton(text: "Login", buttonAction: {
                            IsLogin.toggle()
                        })
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .navigationDestination(isPresented: $IsLogin, destination: {
                    MainPage()
                })
            }
            
        }
        
    }
}

struct MyLoginTextFields: View {
    
    @Binding var emailValue: String
    @Binding var passwordValue: String
    
    var body: some View{
        VStack{
            MyTextField(text: "Email", value: $emailValue)
            MySecurefield(text: "password", value: $passwordValue)
        }
    }
}

struct MySecurefield: View {
    var text: String
    @Binding var value: String
    
    var body: some View {
        SecureField(text, text: $value)
            .font(.body)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .background(.white)
            .cornerRadius(20)
    }
}

struct MyTextField: View {
    var text: String
    @Binding var value: String
    
    var body: some View {
        TextField(text, text: $value)
            .font(.body)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
            .background(.white)
            .cornerRadius(20)
    }
}

#Preview {
    LoginPage()
}

struct MyButton: View {
    var text: String
    var buttonAction: () -> Void = {}
    var body: some View {
        Button(action: buttonAction, label: {
            Text(text)
                .font(.body)
                .padding()
                .padding(.horizontal, 15)
                .background()
                .cornerRadius(20)
        })
    }
}
