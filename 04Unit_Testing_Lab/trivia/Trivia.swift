//
//  Trivia.swift
//  04Unit_Testing_Lab
//
//  Created by Alexander George Legaspi on 8/30/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Trivia]
}

struct Trivia: Codable {
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
    
    static func getTrivia(from data: Data) -> [Trivia] {
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.results
        } catch {
            fatalError("Not able to generate data from JSON")
        }
    }
}
