//
//  NetworkService.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import Foundation

class NetworkService {
    
    private init() { }
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping(Data?, Error?) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                
            } else {
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            }
            
        }.resume()
    }
    
}
