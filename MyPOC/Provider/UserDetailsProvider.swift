//
//  UserDetailsProvider.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 21/09/22.
//

import Foundation

protocol UserDetailsProvider {
    func getUserDetails(completion: @escaping ([UserModel], Bool) -> Void)
    func addUserDetails(userModel: UserModel, completion: @escaping (Bool) -> Void)
}

class UserDetailsDataProvider: UserDetailsProvider {
    
    /// Get user Details
    /// - Parameter completion: usermodel and success status
    func getUserDetails(completion: @escaping ([UserModel], Bool) -> Void) {
        
        // Create the url request
        var request = URLRequest(url: URL(string: Endpoint.getUser.endpointString())!)
        request.httpMethod = "GET"
        
        NetworkManager.shared.makeRequest(request: request) {(result) in
            switch result {
            case .success((let data, _)):
                guard let json = try? JSONDecoder().decode([UserModel].self,from: data) else {
                    print("Errod")
                    completion([],false)
                    return
                }
                completion(json,true)
            case .failure(let error):
                print(error)
                completion([],false)
            }
        }
    }
    
    /// Add User Details
    /// - Parameters:
    ///   - userModel: userModel to add
    ///   - completion: completion status
    func addUserDetails(userModel: UserModel, completion: @escaping (Bool) -> Void) {
        // Create the url request
        
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(userModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        var request = URLRequest(url: URL(string: Endpoint.getUser.endpointString())!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        NetworkManager.shared.makeRequest(request: request) {(result) in
            switch result {
            case .success((let data, _)):
                print(data)
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
}

enum Endpoint {
    case getUser
    case addUser
    
    func endpointString() -> String {
        switch self {
        case .addUser, .getUser:
            return "https://jsonplaceholder.typicode.com/users"
        }
    }
}
