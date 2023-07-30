//
//  TitleRow.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI
import Kingfisher

struct titleRow: View {
    var imageurl = URL(string: "https://images.unsplash.com/photo-1625314887424-9f190599bd56?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2187&q=80")
    
    var name = "Mr Robot"
    var name2 = "User"
    @ObservedObject var viewModel = MessagesManager()
    
    var body: some View {
        HStack(spacing: 20){
            if let imageurl{
                KFImage(imageurl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(50)
            } else {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(Font.title)
                    .bold()
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "circle.fill")
                        .foregroundColor(.green)
                    Text("Online")
                        .foregroundColor(.black)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Button {
                //
                
            } label: {
                Image(systemName: "mic.fill")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                   // .background(.white)
                    .cornerRadius(40)
            }
            
            Button {
                //deleteconversation
                viewModel.deleteMessages()
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    //.background(.white)
                    .cornerRadius(40)
            }


           
        }
        .padding()
    }
}

struct titleRow_Preview: PreviewProvider{
    static var previews: some View{
     titleRow()
            .background(Color.blue)
    }
}

