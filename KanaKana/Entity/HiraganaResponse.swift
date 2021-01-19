//
//  HiraganaResponse.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/19.
//

import Foundation

/// ひらがな API からのレスポンスを Decodable で定義
struct HiraganaResponse: Decodable {
    let requestId: String
    let outputType: String
    let converted: String
}
