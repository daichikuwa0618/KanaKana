//
//  ViewController.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/14.
//

import UIKit

import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private let disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        APIService.call(HiraganaRequest(style: .hiragana, kanji: "林大地"))
            .subscribe(onSuccess: { [weak self] result in
                print(result)
            })
            .disposed(by: disposeBag)
    }


}

