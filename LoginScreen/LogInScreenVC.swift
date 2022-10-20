//
//  ViewController.swift
//  LoginScreen
//
//  Created by Даниил Козлов on 04.10.2022.
//

import UIKit

class LogInScreenVC: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeVC else { return }
        welcomeVC.user = user
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text != user || passwordTF.text != password {
        } else {
                showAlert(with: "Invalid login or password!",
                          and: "Please, enter correct login and password")
            return
        }
    }
    
    @IBAction func forgotUserData() {
        : showAlert(with: "Oops!", and: "Your name is User 🥴")
        ?? showAlert(with: "Oops!", and: "Your password is Password 😽")
    }

    @IBAction func unwind(with segue: UIStoryboardSegue) {
        self.userNameTF.text = ""
        self.passwordTF.text = ""
    }
}

extension LogInScreenVC {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LogInScreenVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
