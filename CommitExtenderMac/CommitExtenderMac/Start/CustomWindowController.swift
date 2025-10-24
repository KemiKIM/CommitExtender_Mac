//
//  CustomWindowController.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/28/24.
//

import Cocoa

class CustomWindowController: NSWindowController, NSToolbarDelegate {
    
    let toolbar = NSToolbar(identifier: "CustomToolbar")
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
//        toolbar.delegate = self
//        toolbar.displayMode = .iconOnly
//        
//        window?.toolbar = toolbar
    }
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        return nil
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [.toggleSidebar]
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [.toggleSidebar]
    }
    
}
