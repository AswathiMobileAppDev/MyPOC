//
//  MockUserDetailsProvider.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 21/09/22.
//

import Foundation

enum ResultType {
    case success,failure
}

class MockUserDetailsDataProvider: UserDetailsProvider {
    
    var result: ResultType = .success
    
    func getUserDetails(completion: @escaping ([UserModel], Bool) -> Void) {
        switch result {
        case .success:
            completion([],true)
        case .failure:
            completion([],false)
        }
    }
    
    func addUserDetails(userModel: UserModel, completion: @escaping (Bool) -> Void) {
        switch result {
        case .success:
            completion(true)
        case .failure:
            completion(false)
        }
    }
}
