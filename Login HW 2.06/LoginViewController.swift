//
//  ViewController.swift
//  Login HW 2.06
//
//  Created by Kate Kashko on 31.03.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
   
    private let userName = "Kate"
    private let password = "1234"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.userName = userName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped() {
        guard let inputText = userNameTF.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        guard userNameTF.text == userName, passwordTF.text == password else {
            showAlert(withTitle: "Invalid login or password",
                      andMessage: "Please enter correct login and password")
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotNameButton() {
        guard let inputText = userNameTF.text, !inputText.isEmpty else {
                showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName) 😊")
                return
            }
    }
    
    @IBAction func forgotPasswordButton() {
            guard let inputText = userNameTF.text, !inputText.isEmpty else {
                    showAlert(withTitle: "Oops!", andMessage: "Your password is \(password) 😊")
                    return
                }
        }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTF.text = ""
        }
        alert.addAction(okAction)
        present(alert,animated: true)
        
    }
}
