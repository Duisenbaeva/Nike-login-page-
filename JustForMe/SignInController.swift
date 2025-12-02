//
//  SignInController.swift
//  JustForMe
//
//  Created by diana on 01.12.2025.
//

import UIKit

class SignInController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var errorName: UILabel!
    @IBOutlet weak var errorEmail: UILabel!
    @IBOutlet weak var errorPassword: UILabel!
    @IBOutlet weak var errorRepeatPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        errorName.isHidden = true
        errorEmail.isHidden = true
        errorPassword.isHidden = true
        errorRepeatPassword.isHidden = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate  = self
        repeatTextField.delegate = self
    }
    

    @IBAction func createPressed(_ sender: Any) {
        var isValid =  true
        
        if nameTextField.text?.isEmpty == true {
            errorName.isHidden = false
            isValid = false
        } else {
            errorName.isHidden = true
        }
        
        if emailTextField.text?.isEmpty == true {
            errorEmail.isHidden = false
            isValid = false
        } else {
            errorEmail.isHidden = true
        }
        
        if passwordTextField.text?.isEmpty == true {
            errorPassword.isHidden = false
            isValid = false
        } else {
            errorPassword.isHidden = true
        }
        
        if repeatTextField.text?.isEmpty == true {
            errorRepeatPassword.isHidden = false
            isValid = false
        } else {
            errorRepeatPassword.isHidden = true
        }
        
        if isValid {
            openNextScreen(identifier: "ViewController")
        }
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        openNextScreen(identifier: "LoginController")
    }
    
    func openNextScreen(identifier: String){
        print("Trying to open: \(identifier)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: identifier)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
