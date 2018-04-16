//
//  ViewController.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/13/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class UsersListViewController: UIViewController, StoryboardInitializable {
    
    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()
    
    var viewModel: UserListViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        refreshControl.beginRefreshing()
        refreshControl.sendActions(for: .valueChanged)
    }
    private func setupUI() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.insertSubview(refreshControl, at: 0)
    }
    
    private func setupBindings() {
        
        // View Model outputs to the View Controller
        viewModel.users
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableView.rx.items(cellIdentifier: UserTableViewCell.Identifier, cellType: UserTableViewCell.self)) { (_, user, cell) in
                cell.configureWithUser(user: user)
            }
            .disposed(by: disposeBag)
        
        viewModel.alertMessage
            .subscribe(onNext: { [weak self] in self?.presentAlert(message: $0) })
            .disposed(by: disposeBag)
        
         // View Controller UI actions to the View Model
        refreshControl.rx.controlEvent(.valueChanged)
        .bind(to: viewModel.reload)
        .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(UserViewModel.self)
        .bind(to: viewModel.selectUser)
        .disposed(by: disposeBag)
        
    }
    
    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}
