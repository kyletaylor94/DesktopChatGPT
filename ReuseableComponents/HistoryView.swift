//
//  HistoryView.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        ZStack{
            Color.black.brightness(0.21)
            VStack{
                ScrollView(showsIndicators: false){
                    ForEach(0..<10){_ in
                        Divider()
                        HistoryCell()
                            .padding()
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
