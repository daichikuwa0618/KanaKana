//
//  ConvertViewController.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/14.
//

import UIKit

import RxCocoa
import RxSwift

class ConvertViewController: UIViewController {
    // MARK: - private property
    private let disposeBag: DisposeBag = DisposeBag()
    // TODO: viewModel を DI によって疎結合にする
    private let viewModel: ConvertViewModelProtocol = ConvertViewModel()

    // MARK: - IBOutlet
    @IBOutlet private var convertButton: UIButton!
    @IBOutlet private var inputTextField: UITextField!

    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConvertButton()
        setupInputTextField()
    }

    private func setupConvertButton() {
        convertButton.setTitle(R.string.convertView.convertButtonTitle(), for: .normal)

        convertButton.rx.tap
            .asDriver() // メインスレッドでの動作を担保するために Driver に変換する
            .drive(onNext: { [weak self] _ in
                guard let self = self,
                      let kanji = self.inputTextField.text else { return }

                self.viewModel.convert(kanji)
            })
            .disposed(by: disposeBag)
    }

    private func setupInputTextField() {
        inputTextField.placeholder = R.string.convertView.inputPlaceholder()
    }
}

