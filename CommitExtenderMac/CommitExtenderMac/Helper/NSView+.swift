//
//  NSView+.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/28/24.
//

import Cocoa

extension NSView {
    
    func backgroundColor(color: NSColor) {
        self.wantsLayer = true
        if let layer = self.layer {
            layer.backgroundColor = color.cgColor
        }
        
    }

}
