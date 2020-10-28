//
//  LogInVC.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/25/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    //    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
    if let email = emailTextField.text, let password = passwordTextField.text {//get password
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
          //guard let strongSelf = self else { return }
            
          if let e = error {
              print(e.localizedDescription)//localized description goes to user
            //TODO create SWITCH that checks for error and present something nicer in an erorr message. 
              //TODO give the user a popup on the app telling them to plug their shit in and not be a dumb fuck
              //put red text inside text field saying invalid text field
          } else {
              //Navigated to chat view controller
              self.performSegue(withIdentifier: "loginComplete", sender: self)
              
              
              }
         
        
        }
        
        
        }

    }
}
