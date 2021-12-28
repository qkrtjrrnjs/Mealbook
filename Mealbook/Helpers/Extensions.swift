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
