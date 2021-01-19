//
//  APIService.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/17.
//

import Foundation

import Alamofire
import RxSwift

final class APIService {
    static func call<T, V>(_ request: T) -> Single<V> where T: BaseApiRequestProtocol, T.ResponseType == V {
        return Single<V>.create { observer in
            let calling = fetchData(request) { response in
                switch response {
                case .success(let result):
                    observer(.success(result as! V))

                case .failure(let error):
                    observer(.failure(error))
                }
            }

            return Disposables.create {
                calling.cancel()
            }
        }
    }

    /// データの取得を実施
    private static func fetchData<T, V>(_ request: T, completion: @escaping ((Result<Decodable, Error>) -> Void)) -> DataRequest where T: BaseApiRequestProtocol, T.ResponseType == V {
        return AF.request(request).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let result = try request.decode(data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
