//
//  RecipeTableViewCell.swift
//  Mealbook
//
//  Created by Chris Park on 12/7/21.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    static let identifier = "RecipeTableViewCellId"
    
    let mealNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let measuresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 19)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let ingredientsMeasuresStackView = UIStackView()
    
    var recipe: Recipe? {
        didSet {
            if let recipe = recipe {
                mealNameLabel.text = recipe.name
                ingredientsLabel.text = combine(recipe.ingredient1, recipe.ingredient2, recipe.ingredient3, recipe.ingredient4, recipe.ingredient5, recipe.ingredient6, recipe.ingredient7, recipe.ingredient8, recipe.ingredient9, recipe.ingredient10, recipe.ingredient11, recipe.ingredient12, recipe.ingredient13, recipe.ingredient14, recipe.ingredient15, recipe.ingredient16, recipe.ingredient17, recipe.ingredient18, recipe.ingredient19, recipe.ingredient20)
                measuresLabel.text = combine(recipe.measure1, recipe.measure2, recipe.measure3, recipe.measure4, recipe.measure5, recipe.measure6, recipe.measure7, recipe.measure8, recipe.measure9, recipe.measure10, recipe.measure11, recipe.measure12, recipe.measure13, recipe.measure14, recipe.ingredient15, recipe.measure16, recipe.measure17, recipe.measure18, recipe.measure19, recipe.measure20)
                instructionsLabel.text = recipe.instructions
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabels() {
        addSubview(mealNameLabel)
        addSubview(ingredientsMeasuresStackView)
        ingredientsMeasuresStackView.addArrangedSubview(ingredientsLabel)
        ingredientsMeasuresStackView.addArrangedSubview(measuresLabel)
        addSubview(instructionsLabel)
        
        ingredientsMeasuresStackView.spacing = 0
        ingredientsMeasuresStackView.axis = .horizontal
        ingredientsMeasuresStackView.distribution = .equalSpacing
        
        mealNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            mealNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            mealNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            mealNameLabel.bottomAnchor.constraint(equalTo: ingredientsMeasuresStackView.topAnchor, constant: -45)
        ])
        
        ingredientsMeasuresStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ingredientsMeasuresStackView.topAnchor.constraint(equalTo: mealNameLabel.bottomAnchor, constant: 45),
            ingredientsMeasuresStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            ingredientsMeasuresStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            ingredientsMeasuresStackView.bottomAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: -60)
        ])
        
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: ingredientsMeasuresStackView.bottomAnchor, constant: 60),
            instructionsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            instructionsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            instructionsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
    }
    
    func combine(_ strings: String?...) -> String {
        return strings.compactMap { $0 }.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }.joined(separator: "\n")
    }
}
