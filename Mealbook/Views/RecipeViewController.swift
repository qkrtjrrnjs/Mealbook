//
//  RecipeViewController.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import UIKit

class RecipeViewController: UIViewController {
    
    let viewModel: RecipeViewModel
    let recipeTableView = UITableView.createTableView(cellClass: RecipeTableViewCell.self, identifier: RecipeTableViewCell.identifier)

    init(viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe"
        view.backgroundColor = .white
        setUpTableView()
        setUpObservables()
        viewModel.fetchData()
    }
    
    private func setUpTableView() {
        view.addSubview(recipeTableView)
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        recipeTableView.alwaysBounceVertical = false
        recipeTableView.separatorColor = .clear
        
        recipeTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recipeTableView.topAnchor.constraint(equalTo: view.topAnchor),
            recipeTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            recipeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpObservables() {
        viewModel.recipes.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.recipeTableView.reloadData()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.showAlert(with: errorMessage)
            }
        }
    }
}

extension RecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.identifier, for: indexPath) as? RecipeTableViewCell
        cell?.recipe = viewModel.recipes.value[indexPath.row]
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
