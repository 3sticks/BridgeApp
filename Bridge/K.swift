//
//  k.swift
//  Bridge
//
//  Created by Hugo Bucci III on 10/28/20.
//  Copyright © 2020 Hugo Bucci III. All rights reserved.

//constants file, easily callable by K.4
//

struct K {
 
    //for segues from login/register buttons
    //dont need them for login/register on main screen cause those are dragged straight from the button and we
    //arent calling the performsegue method
    static let registerPressed = "registerComplete"
    //static so we dont have to create instance of Constants() and can just call constants.registerpressed
    static let loginPressed = "loginComplete"
    static let reusableCell = "reusableCell"

    
}
