import SwiftUI
struct RegisterView: View {
    @State var name=""
    @State var username=""
    @State var password=""
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
                    TextField("Your Name", text: $name)
                        .padding()
                        .background(Color.gray     .opacity(0.2))
                        .cornerRadius(5)
                    TextField("Your UserName", text: $username)
                        .padding()
                        .background(Color.gray     .opacity(0.2))
                        .cornerRadius(5)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    Button(action: {}, label: {
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
