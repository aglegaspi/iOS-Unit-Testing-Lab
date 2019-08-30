//
//  Jokes.swift
//  04Unit_Testing_Lab
//
//  Created by Alexander George Legaspi on 8/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

struct Joke: Codable {
    var setup: String
    var punchline: String
    
    static func getJokes(from data: Data) -> [Joke] {
        do {
            let newJoke = try JSONDecoder().decode([Joke].self, from: data)
            return newJoke
        } catch {
            fatalError("Not able to decode: \(error)")
        }
    }
    
}
