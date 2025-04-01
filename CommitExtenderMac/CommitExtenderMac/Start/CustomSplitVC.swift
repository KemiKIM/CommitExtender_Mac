//
//  CustomSplitVC.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/28/24.
//

import Cocoa

class CustomSplitVC: NSSplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.splitView.delegate = self

        if let inspectorItem = splitViewItems.first {
            inspectorItem.minimumThickness = 140 // 최소 너비 설정
            inspectorItem.maximumThickness = 140 // 최대 너비 설정
            
            inspectorItem.isCollapsed = true // 인스펙터 (좌측 패널)를 닫은 상태로 시작
        }
    }
    
}

