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
            
        //own database!
            
        //f text is entered
        } else {
            
        //url prep
        //create new user in Mysql
        let url = URL(string: "https://mybridgeapp.com/register.php")!//EXCLAMATION POINT OPTIONAL
            //so this accesses the register php url. i might TODO this and possobly change the domaiN
            // url to php file
            // request to this file
            var request = URLRequest(url: url)
            // method to pass data to this file (e.g. via POST)
            request.httpMethod = "POST"
            //this body variable is like entering http://mybridgeapp.com/register.php?username=1&password=3&email=3&fullname=3
            //into the url bar
            
            // body to be appended to url
            //remember the optionals!
            let body =  "username=\(userNameTextField.text!.lowercased())&password=\(passwordTextField.text!)&email=\(emailTextField.text!)&fullname=\(nameTextField.text!)"
            //so i am just giving the user 1 field to enter their name. should i do two like Ahkmed? I dont think its necessary, but if i did, this is how to combine them. %20 is a space
            //fullname=\(firstnameTxt.text!)%20\(lastnameTxt.text!)"
            
            //append the body to the request (url)
            request.httpBody = body.data(using: .utf8)
            
            
            
            
            //proceed with request
            // proceed request
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
                             
                             // successfully registered
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
                }
                                 
                            
                             }.resume()
                  }
        }
    }

//need to send it to next screen lol 
