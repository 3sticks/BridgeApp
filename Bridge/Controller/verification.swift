//
//  verification.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/27/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import Foundation
import Firebase

//probably want this in another file?
 var authUser : User? {
    return Auth.auth().currentUser
}

public func sendVerificationEmail() {
    if authUser != nil && !authUser!.isEmailVerified {
        authUser!.sendEmailVerification(completion: { (error) in
            // Notify the user that the mail has sent or couldn't because of an error.
        })
    }
    else {
        // Either the user is not available, or the user is already verified.
    }
}

