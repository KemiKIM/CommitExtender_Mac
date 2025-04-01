//
//  GitEmojiModel.swift
//  CommitExtenderMac
//
//  Created by 김성호 on 8/22/24.
//

import Foundation

struct GitCommitEmojiModel {
    let art: [String] = ["코드의 구조/형태 등 포맷팅 개선", ":art:", "🎨"]
    let zap: [String] = ["성능 개선", ":zap:", "⚡️"]
    let fire: [String] = ["코드/파일 삭제", ":fire:", "🔥"]
    let bug: [String] = ["버그 수정", ":bug:", "🐛"]
    let ambulance: [String] = ["긴급 수정", ":ambulance:", "🚑"]
    let sparkles: [String] = ["새 기능", ":sparkles:", "✨"]
    let memo: [String] = ["문서 추가/수정", ":memo:", "📝"]
    let lipstick: [String] = ["UI/스타일 파일 추가/수정", ":lipstick:", "💄"]
    let tada: [String] = ["프로젝트 시작", ":tada:", "🎉"]
    let whiteCheckMark: [String] = ["테스트 추가/수정", ":white_check_mark:", "✅"]
    let lock: [String] = ["보안 이슈 수정", ":lock:", "🔒"]
    let bookmark: [String] = ["릴리즈/버전 태그", ":bookmark:", "🔖"]
    let greenHeart: [String] = ["CI 빌드 수정", ":green_heart:", "💚"]
    let pushpin: [String] = ["특정 버전 의존성 고정", ":pushpin:", "📌"]
    let constructionWorker: [String] = ["CI 빌드 시스템 추가/수정", ":construction_worker:", "👷"]
    let chartWithUpwardsTrend: [String] = ["분석, 추적 코드 추가/수정", ":chart_with_upwards_trend:", "📈"]
    let recycle: [String] = ["코드 리팩토링", ":recycle:", "♻️"]
    let heavyPlusSign: [String] = ["의존성 추가", ":heavy_plus_sign:", "➕"]
    let heavyMinusSign: [String] = ["의존성 제거", ":heavy_minus_sign:", "➖"]
    let wrench: [String] = ["구성 파일 추가/삭제", ":wrench:", "🔧"]
    let hammer: [String] = ["개발 스크립트 추가/수정", ":hammer:", "🔨"]
    let globeWithMeridians: [String] = ["국제화/현지화", ":globe_with_meridians:", "🌐"]
    let poop: [String] = ["똥싼 코드", ":poop:", "💩"]
    let rewind: [String] = ["변경 내용 되돌리기", ":rewind:", "⏪"]
    let twistedRightwardsArrows: [String] = ["브랜치 합병", ":twisted_rightwards_arrows:", "🔀"]
    let package: [String] = ["컴파일된 파일 추가/수정", ":package:", "📦"]
    let alien: [String] = ["외부 API 변화로 인한 수정", ":alien:", "👽"]
    let truck: [String] = ["리소스 이동, 이름 변경", ":truck:", "🚚"]
    let pageFacingUp: [String] = ["라이센스 추가/수정", ":page_facing_up:", "📄"]
    let bulb: [String] = ["주석 추가/수정", ":bulb:", "💡"]
    let beers: [String] = ["술 취해서 쓴 코드", ":beers:", "🍻"]
    let cardFileBox: [String] = ["데이터베이스 관련 수정", ":card_file_box:", "🗃️"]
    let loudSound: [String] = ["로그 추가/수정", ":loud_sound:", "🔊"]
    let seeNoEvil: [String] = [".gitignore 추가/수정", ":see_no_evil:", "🙈"]
    let largeBlueDiamond: [String] = ["mcnc 특수성 커밋", ":large_blue_diamond:", "🔷"]
    
    
    var emojiTexts: [String] {
        return
        [
            art[0], zap[0], fire[0], bug[0], ambulance[0], sparkles[0], memo[0], lipstick[0], tada[0], whiteCheckMark[0], lock[0], bookmark[0], greenHeart[0], pushpin[0], constructionWorker[0], chartWithUpwardsTrend[0], recycle[0], heavyPlusSign[0], heavyMinusSign[0], wrench[0], hammer[0], globeWithMeridians[0], poop[0], rewind[0], twistedRightwardsArrows[0], package[0], alien[0], truck[0], pageFacingUp[0], bulb[0], beers[0], cardFileBox[0], loudSound[0], seeNoEvil[0], largeBlueDiamond[0]
        ]
    }
    
    var gitPrefixs: [String] {
        return
        [
            art[1], zap[1], fire[1], bug[1], ambulance[1], sparkles[1], memo[1], lipstick[1], tada[1], whiteCheckMark[1], lock[1], bookmark[1], greenHeart[1], pushpin[1], constructionWorker[1], chartWithUpwardsTrend[1], recycle[1], heavyPlusSign[1], heavyMinusSign[1], wrench[1], hammer[1], globeWithMeridians[1], poop[1], rewind[1], twistedRightwardsArrows[1], package[1], alien[1], truck[1], pageFacingUp[1], bulb[1], beers[1], cardFileBox[1], loudSound[1], seeNoEvil[1], largeBlueDiamond[1]
        ]
    }
    
    var emojis: [String] {
        return
        [
            art[2], zap[2], fire[2], bug[2], ambulance[2], sparkles[2], memo[2], lipstick[2], tada[2], whiteCheckMark[2], lock[2], bookmark[2], greenHeart[2], pushpin[2], constructionWorker[2], chartWithUpwardsTrend[2], recycle[2], heavyPlusSign[2], heavyMinusSign[2], wrench[2], hammer[2],  globeWithMeridians[2], poop[2], rewind[2], twistedRightwardsArrows[2], package[2], alien[2], truck[2], pageFacingUp[2], bulb[2], beers[2], cardFileBox[2], loudSound[2], seeNoEvil[2], largeBlueDiamond[2]
        ]
    }
    
    var count: Int {
        return emojiTexts.count
    }
}
