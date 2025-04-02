//
//  LeftListVC.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/28/24.
//

import Cocoa
import Then
import SnapKit

class LeftListVC: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    let list = ["🥱 Commit", "😆 Emoji"]
    
    let tableView = NSTableView().then {
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Column"))
        $0.addTableColumn(column)
        
        $0.headerView = nil
        $0.rowHeight = 30
    }
    
    let scrollView = NSScrollView()
    
    let commimtExtenderVC = CommitExtenderVC()
    let customEmojiVC = CustomEmojiVC()
    
   
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setupScrollView()
       
        setTableView()
        
        layout()
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    // MARK: Function
    private func setDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    private func setupScrollView() {
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = false
        scrollView.autohidesScrollers = true
    }
    
    
    private func setTableView() {
        let firstRowIndex = 0
        let rowIndexes = IndexSet(integer: firstRowIndex)
        tableView.selectRowIndexes(rowIndexes, byExtendingSelection: false)
    }
    
    
    
    
}


// MARK: TableView
extension LeftListVC {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 1
        // emoji는 현재 개발중인 부분이므로, 일단 숨김
//        return list.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "Cell")
        var cell = NSTableCellView()
        
        if let dequeuedCell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView {
            cell = dequeuedCell
        } else {
            cell.identifier = cellIdentifier
            
            // Create a text field and add it to the cell
            let textField = NSTextField()
            textField.isBordered = false
            textField.backgroundColor = .clear
            textField.isEditable = false
            
            // Add the text field to the cell view
            cell.addSubview(textField)
            textField.snp.makeConstraints {
                $0.top.equalTo(cell.snp.top).offset(5)
                $0.leading.equalTo(cell.snp.leading).offset(5)
                $0.trailing.equalTo(cell.snp.trailing).offset(-5)
                $0.bottom.equalTo(cell.snp.bottom).offset(-5)
            }

            // Assign the text field to the cell's textField property
            cell.textField = textField
        }
        
        
        // Set the text for the current row
        cell.textField?.stringValue = "\(list[row])"
        
        return cell
    }
    
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = tableView.selectedRow
        var changeVC: NSViewController?
       
        
        guard let splitVC = self.view.window?.windowController?.contentViewController as? NSSplitViewController else {
            SHK.error("Fail Set : splitVC")
            return
        }
        
        guard let window = self.view.window else {
            SHK.error("Fail Set : window")
            return
        }
      
        
        
        if selectedRow == 0 {
            changeVC = self.commimtExtenderVC
            window.title = "CommitExtenderMac"

        } else  {
            changeVC = self.customEmojiVC
            window.title = "Emoji"
            
        }
        
        // Change
        if let changedVC = changeVC {
            if splitVC.children.count > 1 {
                splitVC.children[1] = changedVC
            }
        }
    }
}


// MARK: Layout
extension LeftListVC {
    
    private func layout() {
        self.view.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top)
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
}
