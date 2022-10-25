//
//  GreetingsViewController.swift
//  LoginScreen
//
//  Created by Даниил Козлов on 04.10.2022.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(String(describing: user))!"
    }
}
