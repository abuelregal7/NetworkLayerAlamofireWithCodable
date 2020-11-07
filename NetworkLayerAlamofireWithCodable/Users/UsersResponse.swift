//
//  UsersResponse.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/8/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

class UsersResponse: Codable {
    
    var data: [UsersModel]?
    
    enum Codingkeys: String, CodingKey {
        
        case data = "data"
        
    }
}
