//
//  Alert+.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/27/24.
//

import Cocoa

extension NSViewController {
    
    func publicShowAlert(title: String, message: String, btn: String) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.alertStyle = .informational
        alert.addButton(withTitle: btn)
        
        // 아이콘 설정 (예시로 시스템 애플리케이션 아이콘 사용)
        if let appIcon = NSImage(named: NSImage.cautionName) {
            alert.icon = appIcon
        }
        
        alert.runModal()
    }
}
