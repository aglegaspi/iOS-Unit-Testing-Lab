//
//  _4Unit_Testing_LabTests.swift
//  04Unit_Testing_LabTests
//
//  Created by Alexander George Legaspi on 8/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import XCTest
@testable import _4Unit_Testing_Lab

class _4Unit_Testing_LabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testloadJokes() {
        let data = getJokesFromJSON()
        let jokes = Joke.getJokes(from: data)
        XCTAssertTrue(jokes != nil, "not working")
        
    }
    
    func testCountJokes() {
        let data = getJokesFromJSON()
        let jokes = Joke.getJokes(from: data)
        XCTAssertTrue(jokes.count == 10, "not working")
    }
    
    private func getJokesFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "jokes", ofType: "json") else {
            fatalError("Could not find JSON")
        }
        let url = URL(fileURLWithPath: pathToData)
        
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            fatalError("path to json not working: \(error)")
        }
        
    }

    

}
