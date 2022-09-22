//
//  UserTableViewCell.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 20/09/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifier = "UserTableViewCell"
    
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Setup Cell UI
    /// - Parameter userModel: userModel 
    func setupUI(userModel: UserModel) {
        userName.text = userModel.username
        name.text = userModel.name
        userEmail.text = userModel.email
        phoneNumber.text = userModel.phone
        website.text = userModel.website
    }
    
}
