//
//  ViewController.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 20/09/22.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = UserDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell
        self.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.cellReuseIdentifier)
        fetchUserDetails()
    }
    
    @IBAction func addUser(_ sender: UIButton) {
        viewModel.addUserDetails { _ in
            print("Fake user added")
        }
    }
    
    /// To fetch user details
    func fetchUserDetails() {
        viewModel.getUserDetails { _ in
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
