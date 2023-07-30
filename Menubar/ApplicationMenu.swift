//
//  AppDelegate.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//


import SwiftUI
import AppKit

class ApplicationMenu: NSObject, NSMenuDelegate{
    
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        
        let contentview = ContentView()
        let topview = NSHostingController(rootView: contentview)
        topview.view.frame.size = CGSize(width: 500, height: 700)
        
        topview.becomeFirstResponder()

        
        let customMenuItem = NSMenuItem()
        
        customMenuItem.view = topview.view
        menu.addItem(customMenuItem)
        menu.addItem(NSMenuItem.separator())
        
        
        let quitMenuItem = NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        quitMenuItem.keyEquivalentModifierMask = [.command, .shift]
         menu.addItem(quitMenuItem)
        
        
        
        
        menu.delegate = self
        return menu
    }
    
  
}

