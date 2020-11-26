//
//  RegisterViewController.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/26/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import UIKit
import Firebase
import Foundation
class RegisterViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    
    

    @IBAction func registerPressed(_ sender: UIButton) { //what happens when user presses register button
        
        if userNameTextField.text!.isEmpty || nameTextField.text!.isEmpty || emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty  { //TODO also need to add email validation and password validation... do this through the database or local?
            
            //username
            userNameTextField.attributedPlaceholder = NSAttributedString(string: "Please enter a username!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            //name
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Don't you have a name?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            //email
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Please enter a valid email address!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
           
            
            //password
            //Tell them the requirements? below? in the text field? do i do the thing that makes things green or red if theyre met?
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Please enter a valid password!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            //TODO I dont like the red staying there.......... or the new text.... figure that out
        }
        
        //if email text is not nil, and password is not nil, then info can be passed to firebase
        //optional chaining
        if let email = emailTextField.text, let password = passwordTextField.text {//get password
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)//localized description goes to user
                //TODO give the user a popup on the app telling them to plug their shit in and not be a dumb fuck
                //put red text inside text field saying invalid text field
            } else {
                //Navigated to chat view controller
                self.performSegue(withIdentifier: K.registerPressed, sender: self)
                
                SendEmailVer.sendVerificationEmail()
                
                }
            }
            
        }
    }
}
