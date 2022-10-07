//
//  ViewController.swift
//  LoginScreen
//
//  Created by Даниил Козлов on 04.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
            super .touchesBegan(touches, with: event)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? GreetingsViewController else {
            return
        }
        welcomeVC.welcomeLabelVar = String("Welcome, \(userNameTF.text ?? "")!")
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text == "User" && passwordTF.text == "Password" {
        } else {
                showAlert(with: "Invalid login or password!", and: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(with: "Oops!", and: "Your name is User 🥴")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(with: "Oops!", and: "Your password is Password 😽")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is GreetingsViewController else {
            return
        }
        self.userNameTF.text = ""
        self.passwordTF.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTF.becomeFirstResponder()
        return true
    }
}

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}



// Реализовать дублирование кнопкой Done, функции кнопки LogIn
