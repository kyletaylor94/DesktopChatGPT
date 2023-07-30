//
//  MessageBubble.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI

struct MessageBubble: View{
    var message: Messages
    @State private var showTime = false
    
    var body: some View{
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color((.systemGray)) : Color.orange) //Color(red: 0.42, green: 0.36, blue: 0.91))
                    .cornerRadius(15)
                
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(Color(.systemGray))
                    .padding(message.received ? .leading : .trailing, 25)
                    
            }
            
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing )
        .padding(.horizontal, 10)
        .padding(.bottom)
        
    }
}

struct MessageBubble_Preview: PreviewProvider{
    static var previews: some View{
        MessageBubble(message: Messages(id: "12345", text: "I've been waited for you master  ", received: true, timestamp: Date()))
    }
}

