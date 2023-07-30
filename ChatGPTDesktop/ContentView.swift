//
//  ContentView.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI
import AppKit

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                titleRow()
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        //
                        }
                    }
                    .padding(.top, 5)
                    .background(.white)
                .cornerRadius(7)
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)

                        }
                    }
                }
            }
           // .background(Color(red: 0.42, green: 0.36, blue: 0.91))
            .background(Color.gray)
            MessageField()
                .environmentObject(MessagesManager())
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

