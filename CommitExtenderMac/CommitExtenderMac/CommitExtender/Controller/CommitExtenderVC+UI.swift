//
//  CommitExtenderVC+UI.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/22/24.
//

import Cocoa
import SnapKit

extension CommitExtenderVC {
    
    func layout() {
        configureConfirmBtn()
        configureTextField()
        configureLabel()
        configureAlertLabel()
        
        configureScrollView()
    }
    
    func configureConfirmBtn() {
        view.addSubview(self.copyBtn)
        
        self.copyBtn.snp.makeConstraints {
            $0.trailing.equalTo(self.view.snp.trailing).offset(-10)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-10)
            $0.width.equalTo(60)
            $0.height.equalTo(20)
        }
    }
    
    
    func configureTextField() {
        view.addSubview(self.textField)
        
        self.textField.snp.makeConstraints {
            $0.top.bottom.equalTo(self.copyBtn)
            $0.leading.equalTo(self.view.snp.leading).offset(10)
            $0.trailing.equalTo(self.copyBtn.snp.leading).offset(-10)
        }
    }

    func configureLabel() {
        view.addSubview(self.label)
        
        self.label.snp.makeConstraints {
            $0.leading.equalTo(self.textField.snp.leading).offset(2)
            $0.trailing.equalTo(self.textField.snp.trailing).offset(-2)
            $0.bottom.equalTo(self.textField.snp.top).offset(-5)
            $0.height.equalTo(self.textField.snp.height)
        }
    }
    
    func configureAlertLabel() {
        view.addSubview(self.alertLabel)
        
        self.alertLabel.snp.makeConstraints {
            $0.leading.equalTo(self.copyBtn.snp.leading)
            $0.trailing.equalTo(self.copyBtn.snp.trailing)
            $0.top.bottom.equalTo(self.label)
        }
    }

    func configureScrollView() {
        view.addSubview(self.scrollView)
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top)
            $0.leading.equalTo(self.view.snp.leading)
            $0.trailing.equalTo(self.view.snp.trailing)
            $0.bottom.equalTo(self.label.snp.top).offset(-10)
        }
    }
    
}
