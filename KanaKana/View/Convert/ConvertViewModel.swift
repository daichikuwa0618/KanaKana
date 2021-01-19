//
//  ConvertViewModel.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/20.
//

import Foundation

import RxSwift

final class ConvertViewModel: ConvertViewModelProtocol {
    // MARK: - property
    private let disposeBag: DisposeBag = DisposeBag()

    // MARK: - method
    func convert(_ kanji: String) {
        APIService.call(HiraganaRequest(style: .hiragana, kanji: kanji))
            .subscribe(onSuccess: { result in
                // TODO: 成功時の処理
                print(result)
            }, onFailure: { error in
                // TODO: エラーハンドリング
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
