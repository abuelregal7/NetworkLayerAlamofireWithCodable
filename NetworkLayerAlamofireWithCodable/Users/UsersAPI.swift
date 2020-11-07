//
//  UsersAPI.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/7/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation

protocol UsersAPIProtocol {
    func getUsers(completion: @escaping (Result<UsersResponse?, NSError>) -> Void)
}

class UsersAPI: BaseAPI<UsersNetworking>, UsersAPIProtocol {
    
    //Mark:- Requests
    func getUsers(completion: @escaping (Result<UsersResponse?, NSError>) -> Void) {
        
        self.fetchData(target: .getUsers, responseClass: UsersResponse.self) { (result) in
            
            completion(result)
            
        }
        
    }
    
}
