//
//  MessagesManager.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import OpenAIKit
import SwiftUI

public class MessagesManager: ObservableObject{
    @Published private(set) var messages: [Messages] = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    
    func deleteMessages(){
        let db = Firestore.firestore()
        
        db.collection("messages").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            guard let snapshot = snapshot else { return }
            
            let batch = db.batch()
            for document in snapshot.documents {
                batch.deleteDocument(document.reference)
            }
            
            batch.commit() { error in
                if let error = error {
                    print("Error deleting documents: \(error)")
                } else {
                    print("All messages deleted successfully")
                }
            }
        }
    }
    
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetchin documents\(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { documents -> Messages? in
                do{
                    return try documents.data(as: Messages.self)
                } catch{
                    print("error decoding document into Message \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String){
        /*
        guard let infoDictionary: [String: Any] = Bundle.main.infoDictionary else{
            print("Failed to load Info.plist")
            return
        }
        
        guard let mySecretApiKey: String = infoDictionary["MySecretApiKey"] as? String else {
            print("FAiled to retreive api key")
            return
        }
        print("Here's your api key value -> \(mySecretApiKey)")*/
        do{
            
             guard let path = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
                let xml = FileManager.default.contents(atPath: path),
                let plist = try PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any],
                  let apiKey = plist["apiKey"] as? String
              else {
                  fatalError("Unable to get API key from plist file.")
                }
           
             let openAI = OpenAIKit(apiToken: apiKey)
             
             openAI.sendCompletion(prompt: text, model: .gptV3_5(.davinciText003), maxTokens: 2048) { result in
             switch result {
             case .success(let aiResult):
             DispatchQueue.main.async {
             if let response = aiResult.choices.first?.text {
             print("response text: \(response)") //"\n\nHello there, how may I assist you today?"
             let newMessage = Messages(id: "\(UUID())", text: response, received: true, timestamp: Date())
             try? self.db.collection("messages").document().setData(from: newMessage)
             
             }
             }
             case .failure(let error):
             /// Hadle error actions
             print(error.localizedDescription)
             print("hiba az openaitól")
             }
             }
             
             let newMessage = Messages(id: "\(UUID())", text: text, received: false, timestamp: Date())
             try db.collection("messages").document().setData(from: newMessage)
             
             } catch{
             print("error adding message to firestore\(error)")
             }
             }
            
        }
        //
    

