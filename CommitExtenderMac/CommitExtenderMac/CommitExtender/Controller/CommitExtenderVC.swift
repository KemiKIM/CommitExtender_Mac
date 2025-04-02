//
//  CommitExtenderVC.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/22/24.
//

import Cocoa
import Then

class CommitExtenderVC: NSViewController, NSTextFieldDelegate, NSTableViewDataSource, NSTableViewDelegate {
    
    let model: GitCommitEmojiModel = GitCommitEmojiModel()
    var selectNum: Int = 0
    
    // Top
    let tableView = NSTableView().then {
        // Create a column for the table view
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column"))
        $0.addTableColumn(column)
        
        $0.headerView = nil // Disable header if not needed
        $0.rowHeight = 30
    }
    
    let scrollView = NSScrollView()
    
    
    
    // Bottom
    let label = NSTextField().then {
        $0.isEditable = false
        $0.isBezeled = false
        $0.isSelectable = false
        $0.drawsBackground = false
    }
    
    let alertLabel = NSTextField().then {
        $0.isEditable = false
        $0.isBezeled = false
        $0.isSelectable = false
        $0.drawsBackground = true
        $0.backgroundColor = .clear
        
        $0.textColor = .clear
        $0.alignment = .center
        
        // Font
        $0.font = NSFont.systemFont(ofSize: 14, weight: .regular)
        
        // Round
        $0.wantsLayer = true
        $0.layer?.cornerRadius = 5
        $0.layer?.masksToBounds = true
    }
    
    let textField = NSTextField().then {
        $0.placeholderString = "여기에 쓰세요"
        $0.lineBreakMode = .byTruncatingTail  // 줄바꿈 방지
       
        $0.wantsLayer = true
        if let layer = $0.layer {
            layer.cornerRadius = 10
        } else {
            SHK.error("TextField cornerRadius 추출 불가")
        }
    }
    
    let copyBtn = NSButton().then {
        $0.title = "Copy"
        $0.action = #selector(tapBtn)
    }
    
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setupScrollView()
        
        layout()
        
        SHK.debug("viewDidLoad")
    }
    
    override func viewDidDisappear() {
        super.viewDidDisappear()
        
        // init
        self.textField.stringValue = ""
        SHK.debug("viewDidDisappear")
    }
    

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    
    
    
    
    
    // MARK: Function
    private func setDelegate() {
        self.textField.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    private func setupScrollView() {
        scrollView.documentView = tableView // 이게 Point인듯?
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = false
        scrollView.autohidesScrollers = true
    }
    
    
    func customCursorImage() -> NSCursor {
        let systemImageName = NSImage.Name("check")
        guard let systemImage = NSImage(named: systemImageName) else {
            SHK.error("시스템 이미지를 찾을 수 없습니다.")
            fatalError("시스템 이미지를 찾을 수 없습니다.")
        }
        
        let cursorSize = NSSize(width: 30, height: 30)
        let hotSpotPoint = NSPoint(x: cursorSize.width / 2, y: cursorSize.height / 2) // 위치 설정
        systemImage.size = cursorSize
        let customCursor = NSCursor(image: systemImage, hotSpot: hotSpotPoint)
        
        return customCursor
    }

    
    
    func showAlert(_ type: SeeType) {

        DispatchQueue.main.async {
            switch type {
                
                // (1) Copy That
            case .copyThat:
                self.alertLabel.backgroundColor = .systemBlue
                self.alertLabel.stringValue = #"ↀᴥↀ"#
                self.alertLabel.textColor = .white

                // (2) Not Select
            case .notSelect:
                self.alertLabel.backgroundColor = .systemRed
                self.alertLabel.stringValue = "❕"
                self.alertLabel.textColor = .white
                
                // (3) Empty Msg
            case .EmptyMsg:
                self.alertLabel.backgroundColor = .systemYellow
                self.alertLabel.stringValue = "?"
                self.alertLabel.textColor = .black
                
                // (4) other
            default:
                self.alertLabel.backgroundColor = .clear
                
            }
           
        }
        
        
        // init Label Background Color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.alertLabel.backgroundColor = .clear
            self.alertLabel.textColor = .clear
        }
    }
    
    
    
    // MARK: @objc
    @objc func tapBtn() {
        let selectedRow = tableView.selectedRow
        
        // Check Function
        if selectedRow == -1 {
            SHK.debug(("No row is selected."))
            
            self.showAlert(SeeType(value: 1))
            return
        }
        
        // Check Empty Text
        let writeString = self.textField.stringValue
        if writeString == "" {
            SHK.error("Text is empty")

            self.showAlert(SeeType(value: 2))
            return
        }
        
        
        // Success Copy
        let copyString = "\(self.model.gitPrefixs[self.selectNum])" + " " + self.textField.stringValue

        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(copyString, forType: .string)
        
        // push or pop
        self.customCursorImage().push()
        self.showAlert(SeeType(value: 0))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.customCursorImage().pop()
        }
    }
    
}





// MARK: TextField
extension CommitExtenderVC {
    
    // Enter 방지
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
          if commandSelector == #selector(insertNewline(_:)) {
              copyBtn.performClick(nil) // Trigger button action
              return true
          }
          return false
      }
    
}
