//
//  ApiErrorResponseEntity.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/15.
//

import Foundation

/// 通信失敗時の API エラーレスポンス
/// see: https://labs.goo.ne.jp/api_error_info/
struct ApiErrorResponseEntity: Decodable {
    /// HTTP ステータスコード
    let code: Int?
    /// エラーメッセージ
    let message: String?
}
