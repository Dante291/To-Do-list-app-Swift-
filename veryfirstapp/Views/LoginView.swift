//
//  LoginView.swift
//  veryfirstapp
//
//  Created by SAKSHI GUPTA on 18/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LogInViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        
            VStack{
                //header
                ZStack{
                    RoundedRectangle(cornerRadius: 0).foregroundColor(Color.pink).rotationEffect(Angle(degrees: -15))
                    
                    VStack{
                        Text("To Do List").font(.system(size:45)).foregroundColor(Color.white).bold()
                        Text("Get Things Done").font(.system(size:22)).foregroundColor(Color.white).bold()
                    }.padding(.top,30)
                    
                }
                .frame(width:UIScreen.main.bounds.width * 3,height: 300)
                .offset(y:-100)
                
                //logIn form
                Form {
                    
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage).foregroundColor(Color.red)
                        }
                        TextField("Email Address", text: $viewModel.email)
                            .padding()
                            .background(Color.gray     .opacity(0.2))
                            .cornerRadius(5)
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(5)
                        Button(action: {viewModel.LogIn()}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                                Text("Log In").foregroundColor(Color.white)
                            }}).padding()
                    
                }.background(colorScheme == .dark ? Color.black : Color.white)
                    .scrollContentBackground(.hidden)
                
                //Sign In
                VStack{
                    Text("New Around Here?").font(.system(size: 19))
                    NavigationLink("Create An Account", destination: RegisterView()).font(.system(size: 16))
                    
                }.padding(.bottom)
                
                Spacer()
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
