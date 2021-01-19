//
//  JSONDecoder+util.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/19.
//

import Foundation

extension JSONDecoder {
    convenience init(type: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = type
    }

    static let decoder: JSONDecoder = JSONDecoder(type: .convertFromSnakeCase)
}
