//
//  MealViewController.swift
//  Mealbook
//
//  Created by Chris Park on 12/6/21.
//

import UIKit

class MealViewController: UIViewController {
    
    let viewModel: MealViewModel
    let mealTableView = UITableView.createTableView(cellClass: MealTableViewCell.self, identifier: MealTableViewCell.identifier)
    
    init(viewModel: MealViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Meals"
        view.backgroundColor = .white
        setUpTableView()
        setUpObservables()
        viewModel.fetchData()
    }
    
    private func setUpTableView() {
        view.addSubview(mealTableView)
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        mealTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mealTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mealTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mealTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpObservables() {
        viewModel.meals.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.mealTableView.reloadData()
            }
        }
        
        viewModel.errorMessage.bind { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.showAlert(with: errorMessage)
            }
        }
    }
}

extension MealViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.meals.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as? MealTableViewCell
        cell?.meal = viewModel.meals.value[indexPath.row]
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = viewModel.meals.value[indexPath.row]
        let viewModel = RecipeViewModel(apiService: APIService(), mealId: meal.id)
        navigationController?.pushViewController(RecipeViewController(viewModel: viewModel), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
