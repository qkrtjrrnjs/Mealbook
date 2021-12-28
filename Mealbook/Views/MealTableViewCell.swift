//
//  MealTableViewCell.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    static let identifier = "MealTableViewCellId"
    
    let mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var meal: Meal? {
        didSet {
            if let meal = meal {
                mealNameLabel.text = meal.name
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
        addSubview(mealNameLabel)
        
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            mealNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            mealNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            mealNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
}
