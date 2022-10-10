//
//  GreetingsViewController.swift
//  LoginScreen
//
//  Created by Даниил Козлов on 04.10.2022.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
//    Делаю свойство отвечающее за название лэйбла
    
    var welcomeLabelVar: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = welcomeLabelVar
//        Передаю свойство из лэйбла в предыдущий экран чтобы отобразить имя пользователя в лэйбле
    }
    
    @IBAction func logOutButton() {
//        Сделать так чтобы при логауте Логин и пас в ТФах стирались
    }
}
