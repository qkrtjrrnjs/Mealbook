//
//  Extensions.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(with message: String) {
        let alert = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Ok",
            style: .default
        ))
        
        present(alert, animated: true)
    }
}

extension UILabel {
    static func createLabel(textAlignment: NSTextAlignment = .center, numberOfLines: Int = 0, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.font = font
        return label
    }
}

extension UIFont {
    enum AppleSDGothicNeo: String {
        case bold = "AppleSDGothicNeo-Bold"
        case medium = "AppleSDGothicNeo-Medium"
    }
    
    static func customFont(type: AppleSDGothicNeo, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static var boldFont: UIFont {
        return .customFont(type: .bold, size: 25)
    }
    
    static var mediumFont: UIFont {
        return .customFont(type: .medium, size: 20)
    }
}

extension UITableView {
    static func createTableView(cellClass: AnyClass?, identifier: String) -> UITableView {
        let tableView = UITableView()
        tableView.register(cellClass, forCellReuseIdentifier: identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
}
