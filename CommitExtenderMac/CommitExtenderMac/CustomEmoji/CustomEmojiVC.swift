//
//  CustomEmojiVC.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/28/24.
//

import Cocoa

class CustomEmojiVC: NSViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor(color: .systemGray)
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
