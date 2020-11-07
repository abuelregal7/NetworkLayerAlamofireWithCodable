//
//  UsersModel.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/8/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

class UsersModel: Codable {
    
    var firstName: String?
    var lastName : String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName  = "last_name"
    }
    
}
