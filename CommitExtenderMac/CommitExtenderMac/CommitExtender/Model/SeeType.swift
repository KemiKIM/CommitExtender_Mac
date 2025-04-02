//
//  SeeType.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 4/2/25.
//

enum SeeType: Int {
    case copyThat = 0
    case notSelect = 1
    case EmptyMsg = 2
    case other = 3
    
    // 정수 값을 기반으로 변환하는 이니셜라이저
    init(value: Int) {
        self = SeeType(rawValue: value) ?? .other
    }
}
