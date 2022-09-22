//
//  UserModel.swift
//  WelcomePOC
//
//  Created by B, Aswathi on 20/09/22.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var company: Company
    var address: Address
    
}

struct Address: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: Geo
}

struct Geo: Codable {
    var latitude: String
    var longitude: String
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

struct Company: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}
