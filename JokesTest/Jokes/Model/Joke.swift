//
//  Joke.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import Foundation

struct Joke: Codable {
    
    var id: Int
    var joke: String
    var categories: [String]
    
}
