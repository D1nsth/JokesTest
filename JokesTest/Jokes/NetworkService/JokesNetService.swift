//
//  JokesNetService.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import Foundation

class JokesNetService {
    
    private init() { }
    
    static func getJokesData(countJokes: Int, completion: @escaping(GetJokesResponse?, Error?) -> ()) {
        
        guard let url = URL(string: "http://api.icndb.com/jokes/random/\(countJokes)") else { return }
        
        NetworkService.shared.getData(url: url) { (data, error) in
            if error != nil {
                completion(nil, error)
                
            } else {
                do {
                    let response = try GetJokesResponse(data: data)
                    completion(response, nil)
                    
                } catch {
                    completion(nil, error)
                }
            }
            
        }
    }
    
}
