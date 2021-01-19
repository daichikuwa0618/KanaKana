//
//  BaseApiRequestProtocol.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/19.
//

import Foundation

import Alamofire

protocol BaseApiRequestProtocol: BaseApiProtocol, URLRequestConvertible {
    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
}

extension BaseApiRequestProtocol {
    var encoding: URLEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: baseURL + path)!)

        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.timeoutInterval = TimeInterval(30)
        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }

        return urlRequest
    }
}
