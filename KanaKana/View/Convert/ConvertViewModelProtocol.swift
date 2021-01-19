//
//  ConvertViewModelProtocol.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/20.
//

import Foundation

import RxCocoa

protocol ConvertViewModelProtocol {
    /// 変換後の文字列を通知する
    var convertedSignal: Signal<String> { get }
    /// ひらがなに変換する
    func convert(_ kanji: String)
}
