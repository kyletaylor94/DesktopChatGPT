//
//  ChatGPTDesktopApp.swift
//  ChatGPTDesktop
//
//  Created by Turdesán Csaba on 2023. 05. 03..
//


import SwiftUI
import Firebase
import AppKit


class AppDelegate : NSObject, NSApplicationDelegate{
    //static private(set) var instance: AppDelegate!
      
    
    private var popover = NSPopover()
    
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    // var window = NSWindow()
    
    
    @MainActor func applicationDidFinishLaunching(_ notification: Notification) {
        // AppDelegate.instance = self
        
        let nsImage = NSImage(named: NSImage.Name("CVC"))
        nsImage?.size = CGSize(width: 20, height: 20)
        
        statusBarItem.button?.image = nsImage
        statusBarItem.button?.imagePosition = .imageLeading
        
        //statusBarItem.button?.action = #selector(tooglePopover)
        
        statusBarItem.menu = menu.createMenu()
        
       
        
        self.popover = NSPopover()
        self.popover.contentSize = NSSize(width: 500, height: 700)
        self.popover.behavior = .transient
        self.popover.contentViewController = NSHostingController(rootView: ContentView())
        
        func menuWillOpen(_ menu: NSMenu) {
#warning("This is a hack to activate the app when the menu is shown. This will cause the menu to close and re-open when another window was focused before.")
            if !NSApp.isActive {
                NSApp.activate(ignoringOtherApps: true)
                DispatchQueue.main.async {
                    self.statusBarItem.button?.performClick(nil)
                }
            }
        }
        
        
    }
    
    
    
    
}

@main
struct ChatGPTDesktopApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        Settings{
            EmptyView()
            
        }
    }
}



