//
//  AppError.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/15.
//

import Foundation

/// KanaKana アプリで管理するエラー
protocol AppError: Error { }

/// API 呼び出し時のエラー
enum ApiError: AppError {
    case http(_ error: HttpError)
    case unknown
}

/// HTTP エラー
/// see: https://labs.goo.ne.jp/api_error_info/
enum HttpError: AppError {
    // code: 400
    case emptyContentType
    case invalidJson
    case invalidContentType
    case invalidRequestParameter
    case suspendedAppId
    case limitExceeded

    // code: 404
    case urlNotFound

    // code: 405
    case methodNotAllowed

    // code: 413
    case largeBody

    // code: 500
    case internalServerError
}
