//
//  AppDelegate.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/22/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Setting Window Size
        if let window = NSApplication.shared.windows.first {
            self.window = window
            
            // Start
            let initalSize = NSSize(width: 500, height: 400)
            window.setContentSize(initalSize)
            
            window.minSize = NSSize(width: 500, height: 400)
            window.maxSize = NSSize(width: 800, height: 700)
            
            window.center()
            window.collectionBehavior = .fullScreenNone
//            window.title = "CommitExtenderMac"
            
        } else {
            SHK.error("AppDelegate: Window를 찾을 수 없습니다.")
        }
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationWillTerminate(_ aNotification: Notification) { }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

