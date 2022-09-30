//
//  userDetailsViewModel.swift
//  MyPOC
//
//  Created by B, Aswathi on 20/09/22.
//

import Foundation

class UserDetailsViewModel {
    var userDetails: [UserModel] = []
    
    var userDetailsProvider: UserDetailsProvider
    
    init(userDetailsProvider: UserDetailsProvider = UserDetailsDataProvider()) {
        self.userDetailsProvider = userDetailsProvider
    }
    
    /// Fetch user details
    func getUserDetails(completion: @escaping (Bool) -> Void) {
        userDetailsProvider.getUserDetails { userDetails, isSuccess in
            self.userDetails = userDetails
            completion(isSuccess)
        }
    }
    
    /// Add user details
    func addUserDetails(completion: @escaping (Bool) -> Void) {
        let userModel = UserModel(id: 1,
                                  name: "Sample",
                                  username: "sample.user",
                                  email: "sample@sample.com",
                                  phone: "9876543210",
                                  website: "websitesample.com",
                                  company:
                                    Company(name: "Sample & co",
                                            catchPhrase: "Get a sample",
                                            bs: "sample business"),
                                  address:
                                    Address(street: "street1",
                                            suite: "suite",
                                            city: "sample city",
                                            zipcode: "9870",
                                            geo:
                                                Geo(latitude: "-43.9509",
                                                    longitude: "-54.9589")))
        userDetailsProvider.addUserDetails(userModel: userModel) { isSuccess in
            completion(isSuccess)
        }
    }
}
