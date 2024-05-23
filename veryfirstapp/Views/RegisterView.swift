import SwiftUI
struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    
    
    var body: some View {
        
        
        
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(Color.purple.opacity(0.9))
                    .rotationEffect((Angle(degrees: 15)))
                VStack{
                    Text("Register ").font(.system(size:45)).foregroundColor(Color.white).bold()
                    Text("Start Organizing ToDos").font(.system(size:22)).foregroundColor(Color.white).bold()
                }.padding(.top,30)
            }.frame(width:UIScreen.main.bounds.width * 3,height: 300)
                .offset(y:-150)
            
            //registration body
            Form {
                Section {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .lineLimit(1).foregroundColor(Color.red)
                    }
                    TextField("Your Name", text: $viewModel.name)
                        .padding()
                        .background(Color.gray     .opacity(0.2))
                        .cornerRadius(5)
                    TextField("Your Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.gray     .opacity(0.2))
                        .cornerRadius(5)
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    Button(action: {
                        viewModel.signIn()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green)
                            Text("Sign In").foregroundColor(Color.white)
                        }}).padding()
                }
            }.offset(y:-60)
                .background(colorScheme == .dark ? Color.black : Color.white)
                .scrollContentBackground(.hidden)
            
            Spacer()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
