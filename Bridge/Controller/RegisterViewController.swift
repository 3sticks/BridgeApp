//
//  RegisterViewController.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/26/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func registerPressed(_ sender: UIButton) { //what happens when user presses register button
        
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
                self.performSegue(withIdentifier: "registerComplete", sender: self)
                
                }
            }
            
        }
    }
}
