//
//  ConvertViewAlert.swift
//  KanaKana
//
//  Created by Daichi Hayashi on 2021/01/20.
//

import Foundation
import UIKit

/// ConvertView で使用する Alert
enum ConvertViewAlert {
    /// 変換成功時の結果を出力するアラート
    static func createResultAlert(kanji: String, converted: String) -> UIAlertController {
        let alert = UIAlertController(title: R.string.convertView.successAlertTitle(kanji),
                                      message: R.string.convertView.successAlertMessage(converted),
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: R.string.convertView.successAlertButton(),
                                      style: .default,
                                      handler: nil))

        return alert
    }
}
