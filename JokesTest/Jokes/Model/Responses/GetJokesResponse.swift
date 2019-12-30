//
//  GetJokesResponse.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import Foundation

struct GetJokesResponse {
    
    typealias JSON = [String: AnyObject]
    var result: [Joke] = []
    
    init(data: Data?) throws {
        
        do {
            guard let data = data else { return }
            
            let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
            let dataResult = try JSONSerialization.data(withJSONObject: json["value"] as Any, options: [])
            
            self.result = try JSONDecoder().decode([Joke].self, from: dataResult)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
