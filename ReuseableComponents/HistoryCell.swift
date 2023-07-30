//
//  HistoryCell.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import SwiftUI

struct HistoryCell: View {
    var body: some View {
        
        
        HStack{
            Image(systemName: "message")
                .foregroundColor(.white)
            
            Text("SwiftUI desktop alkalmazás...")
                .font(.system(size: 14))
                .foregroundColor(.white)
            
            Image(systemName: "trash")
                .foregroundColor(.white)
            
        }
    }
}

struct HistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCell()
    }
}
