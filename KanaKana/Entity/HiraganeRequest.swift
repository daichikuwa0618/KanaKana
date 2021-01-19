//
//  HiraganeRequest.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/19.
//

import Foundation

import Alamofire

struct HiraganaRequest: BaseApiRequestProtocol {
    /// 出力形式: hiragana → かな、katakana → カナとなる。
    enum Style: String {
        case hiragana
        case katakana
    }

    // MARK: - BaseApiRequestProtocol requirement
    typealias ResponseType = HiraganaResponse

    var path: String {
        return "hiragana"
    }

    var method: HTTPMethod {
        return .post
    }

    var parameters: Parameters? {
        return [
            "app_id": "279f620fb4f3b2aa347fd421071581c3bc64b2838efda477756521b5acec801b",
            "sentence": kanji,
            "output_type": style
        ]
    }

    /// 出力形式をかな/カナで定義
    let style: Style
    /// 変換したい漢字混じりの文字列
    let kanji: String
}
