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
            self.performSegue(withIdentifier: K.loginPressed, sender: self)
              
              
              }
         
        
        }
        
        
        }

    }
}


//FIRAuth.auth()?.signInWithEmail(txtUsername.text!, password: txtPassword.text!) {
//       (user, error) in
//       if let user = FIRAuth.auth()?.currentUser {
//           if !user.emailVerified{
//               let alertVC = UIAlertController(title: "Error", message: "Sorry. Your email address has not yet been verified. Do you want us to send another verification email to \(self.txtUsername.text).", preferredStyle: .Alert)
//               let alertActionOkay = UIAlertAction(title: "Okay", style: .Default) {
//                   (_) in
//                       user.sendEmailVerificationWithCompletion(nil)
//               }
//               let alertActionCancel = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
//
//               alertVC.addAction(alertActionOkay)
//               alertVC.addAction(alertActionCancel)
//               self.presentViewController(alertVC, animated: true, completion: nil)
//           } else {
//               print ("Email verified. Signing in...")
//           }
//       }
