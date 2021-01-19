//
//  BaseApiProtocol.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/16.
//

import Foundation

import Alamofire

protocol BaseApiProtocol {
    associatedtype ResponseType: Decodable

    var method: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }

    var headers: [String: String]? { get }

    var decode: (Data) throws -> ResponseType { get }
}

/// API で共通となるパラメータを extension により実装しておく
extension BaseApiProtocol {
    var method: HTTPMethod {
        .get
    }


    var baseURL: String {
        "https://labs.goo.ne.jp/api/"
    }


    var headers: [String: String]? {
        nil
    }

    var decode: (Data) throws -> ResponseType {
        return { data in
            try JSONDecoder.decoder.decode(ResponseType.self, from: data)
        }
    }
}
