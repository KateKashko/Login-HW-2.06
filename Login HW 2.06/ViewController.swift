//
//  ViewController.swift
//  Login HW 2.06
//
//  Created by Kate Kashko on 31.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var logInButtomTappet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func loginButtonTapped() {
        guard var inputText = userNameTF.text, !inputText.isEmpty else {
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
            return
        }
        
        let usernamePattern = "ˆ[a-zA-Z]{3,20}$"
                let isUserNameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
                    .evaluate(with: inputText)
                if !isUserNameValid {
                    showAlert(withTitle: "Invalid login or password",
                              andMessage: "Please enter correct login and password")
                }
                userNameTF.text = ""
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "GreetingViewController") as! GreetingViewController
        vc.userName = userNameTF.text!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgotNameButton() {
        guard let inputText = userNameTF.text, !inputText.isEmpty else {
                showAlert(withTitle: "Oops!", andMessage: "Your name is Kate 😊")
                return
            }
    }
    
    @IBAction func forgotPasswordButton() {
            guard let inputText = userNameTF.text, !inputText.isEmpty else {
                    showAlert(withTitle: "Oops!", andMessage: "Your password is 1234 😊")
                    return
                }
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
