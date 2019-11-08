//
//  User.swift
//  1. Member Registration Screen
//
//  Created by 矢守叡 on 2019/10/23.
//  Copyright © 2019 yamolean. All rights reserved.
//

import Foundation

final class User: Decodable {
    let id: UInt64
    let name: String
    let gender: Gender
    let age: Int
    let place: String
    let bio: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case gender = "gender"
        case age = "age"
        case place = "place"
        case bio = "bio"
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(UInt64.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        gender = Gender.init(rawValue: try values.decode(Int.self, forKey: .gender)) ?? .notset
        age = try values.decode(Int.self, forKey: .age)
        place = try values.decode(String.self, forKey: .place)
        bio = try values.decode(String.self, forKey: .bio)
        token = try values.decode(String.self, forKey: .token)
    }
}

