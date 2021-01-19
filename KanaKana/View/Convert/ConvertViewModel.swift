//
//  ConvertViewModel.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/20.
//

import Foundation

import RxCocoa
import RxSwift

final class ConvertViewModel: ConvertViewModelProtocol {
    // MARK: - property
    private let disposeBag: DisposeBag = DisposeBag()

    private let convertedRelay: PublishRelay<String> = PublishRelay()
    private let apiErrorRelay: PublishRelay<String> = PublishRelay()

    var convertedSignal: Signal<String> {
        convertedRelay.asSignal()
    }
    var apiErrorSignal: Signal<String> {
        apiErrorRelay.asSignal()
    }

    // MARK: - method
    func convert(_ kanji: String) {
        APIService.call(HiraganaRequest(style: .hiragana, kanji: kanji))
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }

                self.convertedRelay.accept(result.converted)
            }, onFailure: { [weak self] error in
                guard let self = self else { return }

                // TODO: エラー原因を通知できるようにする
                self.apiErrorRelay.accept("不明なエラーです。")
            })
            .disposed(by: disposeBag)
    }
}
