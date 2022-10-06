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
            guard let inputText = userNameTF.text, inputText.isEmpty else {
                let loginFailure = UIAlertController(title: "Invalid login or password!", message: "Please, enter correct login and password", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default)
                
                loginFailure.addAction(okButton)
                present(loginFailure, animated: true)
            return
            }
        }
    }
    
    @IBAction func forgotUserNameButton() {
        let userNameReminder = UIAlertController(title: "Oops!", message: "Your name is User 🥴", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        userNameReminder.addAction(okButton)
        present(userNameReminder, animated: true)
    }
    
    @IBAction func forgotPasswordButton() {
        let passwordReminder = UIAlertController(title: "Oops!", message: "Your password is Password 😽", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        
        passwordReminder.addAction(okButton)
        present(passwordReminder, animated: true)
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
        private func showAlert(with title: String, and message: String) {
            guard userNameTF.text != nil else {
                return
        }
    }
    
    // Сделать функцию для выведения алертов
}
