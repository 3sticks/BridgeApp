//
//  AuthUser.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/27/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.
//

import Foundation
import Firebase


class <#name#>: <#super class#> {
    <#code#>
}
private var authUser : User? {
    return Auth.auth().currentUser
}

public func sendVerificationMail() {
    if self.authUser != nil && !self.authUser!.isEmailVerified {
        self.authUser!.sendEmailVerification(completion: { (error) in
            // Notify the user that the mail has sent or couldn't because of an error.
        })
    }
    else {
        // Either the user is not available, or the user is already verified.
    }
}
