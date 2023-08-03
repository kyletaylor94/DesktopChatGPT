//
//  CustomTextField.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI
import Cocoa


struct CustomTextField: View{
  //  @FocusState var prompt: Bool = false
    var placeholder: Text
    @Binding var text: String

    var body: some View{
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text)
               
                .focusable(true)
                
                .cornerRadius(10)
        }
        
    }
}



