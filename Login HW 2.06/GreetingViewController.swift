//
//  GreetingViewController.swift
//  Login HW 2.06
//
//  Created by Kate Kashko on 31.03.2023.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName = "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    @IBAction func logoutButton() {
        dismiss(animated: true)
    }
    
}
