//
//  MessageField.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI


struct MessageField: View {
    
    @EnvironmentObject var messagesManager: MessagesManager
    @State var message = ""
   
    
    var body: some View {
        HStack{
           CustomTextField(placeholder: Text("Enter your message here"), text: $message)
          
            Button {
               
            messagesManager.sendMessage(text: message)
            message = ""
                
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.black)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color(.systemGray))
        .cornerRadius(50)
        .padding()
    }
   
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField().environmentObject(MessagesManager())
    }
}

