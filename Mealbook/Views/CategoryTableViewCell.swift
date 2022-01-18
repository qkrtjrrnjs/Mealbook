//
//  CategoryTableViewCell.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryTableViewCellId"

    let categoryNameLabel = UILabel.createLabel(font: .mediumFont)
    
    var category: Category? {
        didSet {
            if let category = category {
                categoryNameLabel.text = category.name
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabel() {
        addSubview(categoryNameLabel)
        
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            categoryNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            categoryNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            categoryNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}
