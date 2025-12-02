//
//  LoginController.swift
//  JustForMe
//
//  Created by diana on 01.12.2025.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var errorUsername: UILabel!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        errorPassword.isHidden = true
        errorUsername.isHidden = true
        
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func startPressed(_ sender: Any) {
       
        var isValid = true
        if usernameField.text?.isEmpty == true {
            errorUsername.isHidden = false
            isValid = false
            
        } else {
            errorUsername.isHidden = true
        }
        
        if passwordField.text?.isEmpty == true {
            errorPassword.isHidden = false
            isValid = false
            
        } else {
            errorPassword.isHidden = true
        }
    
        if isValid {
            openNextScreen(identifier: "ViewController")
        }
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        openNextScreen(identifier: "SignInController")
    }
    
    func openNextScreen(identifier: String) {
        print("Trying to open: \(identifier)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true)
        
    }
    
    func textFieldShoulReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
