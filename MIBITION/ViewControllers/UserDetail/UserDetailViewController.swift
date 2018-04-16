//
//  UserDetailViewController.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/14/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class UserDetailViewController: UIViewController, StoryboardInitializable {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var lblUserBio: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!
    @IBOutlet weak var lblUserCompany: UILabel!
    @IBOutlet weak var lblUserLocation: UILabel!
    @IBOutlet weak var lblUserRepos: UILabel!
    @IBOutlet weak var lblUserGists: UILabel!
    @IBOutlet weak var lblUserFollowers: UILabel!
    @IBOutlet weak var lblUserFollowing: UILabel!
    
    var viewModel: UserDetailViewModel!
    private let disposeBag = DisposeBag()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    private func setupBindings() {
        
        // View Model outputs to the View Controller
        viewModel.userDetail.map{$0.userImage}.bind(to: userImage.rx.imageURL).disposed(by: disposeBag)
        viewModel.userDetail.map{$0._userBio ?? "N/A"}.bind(to: lblUserBio.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{$0._name ?? "N/A"}.bind(to: lblUserName.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{$0._userEmail ?? "N/A"}.bind(to: lblUserEmail.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{$0._company ?? "N/A"}.bind(to: lblUserCompany.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{$0._userLocation ?? "N/A"}.bind(to: lblUserLocation.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{String($0.userFollowers)}.bind(to: lblUserFollowers.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{String($0.userFollowing)}.bind(to: lblUserFollowing.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{String($0.publicRepos)}.bind(to: lblUserRepos.rx.text).disposed(by: disposeBag)
        viewModel.userDetail.map{String($0.publicGists)}.bind(to: lblUserGists.rx.text).disposed(by: disposeBag)
        
        viewModel.alertMessage
            .subscribe(onNext: { [weak self] in self?.presentAlert(message: $0) })
            .disposed(by: disposeBag)
        
        
    }
    
    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
    override func didMove(toParentViewController parent: UIViewController?) {
        
    }
}
