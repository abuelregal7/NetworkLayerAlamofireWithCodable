//
//  UsersNetworking.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/7/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import Alamofire

enum UsersNetworking {
    
    case getUsers
    case creatUsers(name: String, job: String)
    
}

extension UsersNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://reqres.in/api"
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .creatUsers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        case .creatUsers:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .getUsers:
            return .requestPlain
        case .creatUsers(let name, let job):
            return .requestParameters(parameters: ["name": name, "jobe": job], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
            
        }
    }
    
    
    
    
}
