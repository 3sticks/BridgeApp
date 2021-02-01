//
//  ResetPWViewController.swift
//  Bridge
//
//  Created by Hugo Bucci III on 12/29/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import UIKit

class ResetPWViewController: UIViewController {
    
    //UI object
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hides the back button -- just a demo, not keeping here
        //self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        if emailText.text!.isEmpty {
            
            //red placeholder
            emailText.attributedPlaceholder = NSAttributedString(string: "Please enter your email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
        //can we add an email verifier here?? TODO like make sure valid email address
     else {
            
            let email = emailText.text!.lowercased()
            
            //send mysql request
                       let url = URL(string: "https://mybridgeapp.com/resetpassword.php")! //path to login file
                       var request = URLRequest(url: url)
                       
                       request.httpMethod = "POST"
                       
            
                       //add email to body to be appended to the url
                       let body = "email=\(email)"
                       
                       
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
                                                
            
                                                   
                                                   print(parseJSON) //this is the logger message
                                                    
                                                // if unable to process request
                                               
                                               
                                            } catch {
                                                   
                                                   print("Caught an error \(error)")

                                               }
                                       })
                                       
                                    }else {
                                       
                                       print(error)
                                   }}.resume()

                       }

                   }
    
    //mysql request
    
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

