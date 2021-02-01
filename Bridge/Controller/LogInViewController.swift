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

    
    @IBOutlet weak var userNameTextField: UITextField!// do username or username?
    @IBOutlet weak var passwordTextField: UITextField!
    

    //    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            
            //username
            userNameTextField.attributedPlaceholder = NSAttributedString(string: "Please enter a username!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            //name
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Did you forget your password?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            
            
        }
        
        else{
            
            let username = userNameTextField.text!.lowercased()
            let password = passwordTextField.text!
            
            //send mysql request
            let url = URL(string: "https://mybridgeapp.com/login.php")! //path to login file
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            
            let body = "username=\(username)&password=\(password)"
            
            
            request.httpBody = body.data(using: .utf8)
                    
                    // launch session
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        
                        //check for error
                        //no error
                         if error == nil {
                        //send request
                             
                            // get main queue in code process to communicate back to user interface
                             DispatchQueue.main.async(execute: {
                                 
                                 do {
                                     // get json result
                                     let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary //data is in a dictionary form -- you know what that means
                                     
                                     // assign json to new var parseJSON in guard/secured way
                                     guard let parseJSON = json else { ///guard is a safety method  if parse is not equal to json, break and present error
                                         print("Error while parsing")
                                         return
                                     }
                                     
                                     // get id from parseJSON dictionary
                                     let id = parseJSON["id"]//(id from dictionary) is this the best way to do this?
                                     
                                     // successfully logged in
                                     if id != nil {
                                        
                                        print(parseJSON)
                                         
                                     // if unable to process request
                                    } 
                                    
                                 } catch {
                                        
                                        print("Caught an error \(error)")

                                    }
                            })
                            
                         }else {
                            
                            print(error)
                        }}.resume()
            }

        }
    
    }

