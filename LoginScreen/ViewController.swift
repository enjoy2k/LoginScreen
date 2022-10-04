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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? GreetingsViewController else {
            return
        }
        welcomeVC.welcomeLabelVar = String("Welcome, \(userNameTF.text ?? "")!")
    }
    
    @IBAction func logInButtonPressed() {
        //        Здесь нужно сверить правильность полей
        guard let inputText = userNameTF.text, inputText.isEmpty else {
            let loginFailure = UIAlertController(title: "Invalid login or password!", message: "Please, enter correct login and password", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default)
            
            loginFailure.addAction(okButton)
            present(loginFailure, animated: true)
        return
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
    
    //    Здесь сделать @IBAction unwind() Чтобы очистить ТФы через кнопку логаут
    //    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
    //    self.logInTF.text = ""
   //     self.passwordTF.text = ""
    //}
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        passwordTF.becomeFirstResponder()
        return true
    }
    //    private func showAlert(with title: String, and message: String) {
    //        guard let inputText = userNameTF.text, !userNameTF.isEmpty else {
    //            showAlert(with: "Text field is empty", and: "Please enter your name")
    //            return
    //    }
    //}
    
    // Сделать функцию для выведения алертов
}
