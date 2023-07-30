//
//  Messages.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import Foundation

struct Messages: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
