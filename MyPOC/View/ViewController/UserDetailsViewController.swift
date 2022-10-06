//
//  ViewController.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 20/09/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = UserDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.cellReuseIdentifier)
        fetchUserDetails()
    }
    
    // Add user details - main branch
    @IBAction func addUser(_ sender: UIButton) {
        activityIndicator.startAnimating()
        viewModel.addUserDetails { _ in
            self.activityIndicator.stopAnimating()
            let alert = UIAlertController(title: "Add", message: "New User Added", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /// To fetch user details
    func fetchUserDetails() {
        activityIndicator.startAnimating()
        viewModel.getUserDetails { _ in
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
    
}

// MARK: UITableViewDataSource
extension UserDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return viewModel.userDetails.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellReuseIdentifier, for: indexPath) as? UserTableViewCell {
            let model = viewModel.userDetails[indexPath.row]
            cell.setupUI(userModel: model)
            return cell
        }
        return UITableViewCell()
    }
}
