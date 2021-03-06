//
//  BaseAPI.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/7/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import Alamofire


class BaseAPI<T: TargetType>{
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion: @escaping (Result<M?,NSError>) -> Void) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParams(task: target.task)
        
        AF.request(target.baseURL + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else {
                
                completion(.failure(NSError()))
                return
            }
            if statusCode == 200 {
                
                // Successful request
                guard let theJsonResponse =  try? response.result.get() else {
                    
                    // ADD Custom Error
                    completion(.failure(NSError()))
                    return
                }
                
                guard let theJsonData = try? JSONSerialization.data(withJSONObject: theJsonResponse, options: []) else {
                    
                    // ADD Custom Error
                    completion(.failure(NSError()))
                    return
                }
                guard let theJsonObj = try? JSONDecoder().decode(M.self, from: theJsonData) else {
                    
                    // ADD Custom Error
                    completion(.failure(NSError()))
                    return
                }
                completion(.success(theJsonObj))
            }else {
                 // ADD custom error base on status code 404 / 401 /
                completion(.failure(NSError()))
            }
            
        }
        
    }
    
    private func buildParams (task: Task) -> ([String:Any], ParameterEncoding) {
        
        switch task {
        
        case .requestPlain:
            return ([:], URLEncoding.default)
            
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        
        }
        
    }
}
