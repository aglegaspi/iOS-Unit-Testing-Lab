//
//  JokesViewController.swift
//  04Unit_Testing_Lab
//
//  Created by Alexander George Legaspi on 8/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit
import Foundation

class JokesViewController: UIViewController {
    
    
    var jokes = [Joke]() {
        didSet {
            jokesTableView.reloadData()
        }
    }
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    private func configureTableView() {
        jokesTableView.delegate = self
        jokesTableView.dataSource = self
    }
    
    private func loadData() {
        guard let pathToJSON = Bundle.main.path(forResource: "jokes", ofType: "json") else {
            fatalError("no JSON file")
        }
        
        let url = URL(fileURLWithPath: pathToJSON)
        
        do {
            let data = try Data(contentsOf: url)
            let jokesFromJSON =  Joke.getJokes(from: data)
            jokes = jokesFromJSON
        } catch {
            fatalError("couldn't get jokes: \(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueidentifer = segue.identifier else {
            fatalError("could not get segue")
        }
        
        switch segueidentifer {
        case "JokeCell":
            guard let selectedIndexPath = jokesTableView.indexPathForSelectedRow,
                let jokeDetail = segue.destination as? JokeDetailedViewController else {
                    fatalError("No row was selected")
            }
            jokeDetail.joke = jokes[selectedIndexPath.row]
            
        default:
            fatalError("Unexpected segue identifier")
        }
    }
}

extension JokesViewController: UITableViewDelegate {}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokesTableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath)
        
        cell.textLabel?.text = jokes[indexPath.row].setup
        
        return cell
    }
    
}
