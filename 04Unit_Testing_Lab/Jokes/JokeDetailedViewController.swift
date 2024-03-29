//
//  JokeDetailedViewController.swift
//  04Unit_Testing_Lab
//
//  Created by Alexander George Legaspi on 8/29/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit
import Foundation

class JokeDetailedViewController: UIViewController {
        var joke: Joke!
    
    @IBOutlet weak var setupOutlet: UITextView!
    @IBOutlet weak var punchlineOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupOutlet.text = joke.setup
        punchlineOutlet.text = joke.punchline
   
    }


}
