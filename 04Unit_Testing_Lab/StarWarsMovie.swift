//
//  StarWarsMovie.swift
//  04Unit_Testing_Lab
//
//  Created by Alexander George Legaspi on 8/30/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

struct StarWarsMovie: Codable {
    var results: [Episode]
}

struct Episode: Codable {
    var title: String
    var episode_id: Int
    var release_date: String
    
    static func getEpisode(from data: Data) -> [Episode?] {
        
        do {
            let movie = try JSONDecoder().decode(StarWarsMovie.self, from: data)
            return movie.results
        } catch {
            fatalError("Couldn't generate episode")
        }
    }
    
}
