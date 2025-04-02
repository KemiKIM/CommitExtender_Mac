//
//  CommitExtenderVC+TV.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 4/2/25.
//

import Cocoa

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
            SHK.info("Selected row: \(selectedRow) | \(self.label.stringValue)")
            
            self.selectNum = selectedRow
            self.label.stringValue = "\(self.model.emojis[selectedRow])  \(self.model.emojiTexts[selectedRow])"
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

