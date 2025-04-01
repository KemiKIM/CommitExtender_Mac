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
            print("TextField cornerRadius 추출 불가")
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
            fatalError("시스템 이미지를 찾을 수 없습니다.")
        }
        
        let cursorSize = NSSize(width: 30, height: 30)
        let hotSpotPoint = NSPoint(x: cursorSize.width / 2, y: cursorSize.height / 2) // 위치 설정
        systemImage.size = cursorSize
        let customCursor = NSCursor(image: systemImage, hotSpot: hotSpotPoint)
        
        return customCursor
    }
        
    
    func showAlertLabel(bool: Bool, label: String) {
        // Success Copy Alert
        DispatchQueue.main.async {
            self.alertLabel.stringValue = label
            self.alertLabel.textColor = .white
            if bool == true {
                self.alertLabel.backgroundColor = .systemBlue
            } else {
                self.alertLabel.backgroundColor = .systemRed
            }
           
        }
        
        // Label init
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.alertLabel.backgroundColor = .clear
            self.alertLabel.textColor = .clear
        }
    }
    
    
    
    // MARK: @objc
    @objc func tapBtn() {
        let selectedRow = tableView.selectedRow
        
        // Function
        if selectedRow == -1 {
            print("No row is selected.")
            self.showAlertLabel(bool: false, label: "Func !")
            return
        }
        
        // Text
        let writeString = self.textField.stringValue
        if writeString == "" {
            print("Text is empty")
            self.showAlertLabel(bool: false, label: "Msg !")
            return
        }
        
        // Success Copy
        let copyString = "\(self.model.gitPrefixs[self.selectNum])" + " " + self.textField.stringValue

        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(copyString, forType: .string)
        
        // push or pop
        self.customCursorImage().push()
        self.showAlertLabel(bool: true, label: "OK")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.customCursorImage().pop()
        }
    }
    
}





// MARK: TextField
extension CommitExtenderVC {
    
    // Enter 방지
//    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
//        if commandSelector == #selector(insertNewline(_:)) {
//            return true
//        }
//        return false
//    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
          if commandSelector == #selector(insertNewline(_:)) {
              copyBtn.performClick(nil) // Trigger button action
              return true
          }
          return false
      }
    
}



// MARK: TableView
extension CommitExtenderVC {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "Cell")
        
        var cell: NSTableCellView?
        if let dequeuedCell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView {
            cell = dequeuedCell
        } else {
            cell = NSTableCellView()
            cell?.identifier = cellIdentifier
            
            // Create a text field and add it to the cell
            let textField = NSTextField()
            textField.isBordered = false
            textField.backgroundColor = .clear
            textField.isEditable = false
            
            // Add the text field to the cell view
            cell?.addSubview(textField)
            
            // Set constraints for the text field to fill the cell
            textField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                textField.leadingAnchor.constraint(equalTo: cell!.leadingAnchor, constant: 5),
                textField.trailingAnchor.constraint(equalTo: cell!.trailingAnchor, constant: -5),
                textField.topAnchor.constraint(equalTo: cell!.topAnchor, constant: 5),
                textField.bottomAnchor.constraint(equalTo: cell!.bottomAnchor, constant: -5)
            ])
            
            // Assign the text field to the cell's textField property
            cell?.textField = textField
        }
        
        
        // Set the text for the current row
        cell?.textField?.stringValue = "\(self.model.emojis[row])  \(self.model.emojiTexts[row])"
        
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = tableView.selectedRow
        if selectedRow != -1 {
            print("Selected row: \(selectedRow)")
            self.selectNum = selectedRow
            self.label.stringValue = "\(self.model.emojis[selectedRow])  \(self.model.emojiTexts[selectedRow])"
            print(self.label.stringValue)
        }
    }
    
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 36 { // Enter key code
            if tableView.selectedRow >= 0 {
                textField.becomeFirstResponder() // Move focus to textField
            }
        } else {
            super.keyDown(with: event)
        }
    }
    
}


