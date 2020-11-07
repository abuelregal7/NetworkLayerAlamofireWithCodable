//
//  ViewController.swift
//  NetworkLayerAlamofireWithCodable
//
//  Created by Ahmed on 11/7/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        call()
    }
    func call () {
        
        let api: UsersAPIProtocol = UsersAPI()
        api.getUsers { (result) in
            
            switch result {
                
            case .success(let response):
                let users = response?.data
                for user in users ?? [] {
                    
                    print("\(user.firstName!) \(user.lastName!)")
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        
    }
    
}

