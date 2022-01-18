//
//  CategoryViewController.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import UIKit

class CategoryViewController: UIViewController {

    let viewModel: CategoryViewModel
    let categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categories"
        view.backgroundColor = .white
        setUpTableView()
        setUpObservables()
        viewModel.fetchData()
    }
    
    private func setUpTableView() {
        view.addSubview(categoryTableView)
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.topAnchor),
            categoryTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpObservables() {
        viewModel.categories.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.categoryTableView.reloadData()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.showAlert(with: errorMessage)
            }
        }
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.category = viewModel.categories.value[indexPath.row]
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = viewModel.categories.value[indexPath.row]
        let viewModel = MealViewModel(apiService: APIService(), categoryName: category.name)
        navigationController?.pushViewController(MealViewController(viewModel: viewModel), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
