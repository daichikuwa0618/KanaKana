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

    var convertedSignal: Signal<String> {
        convertedRelay.asSignal()
    }

    // MARK: - method
    func convert(_ kanji: String) {
        APIService.call(HiraganaRequest(style: .hiragana, kanji: kanji))
            .subscribe(onSuccess: { [weak self] result in
                guard let self = self else { return }

                self.convertedRelay.accept(result.converted)
            }, onFailure: { error in
                // TODO: エラーハンドリング
                print(error)
            })
            .disposed(by: disposeBag)
    }
}
