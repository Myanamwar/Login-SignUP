//
//  Login-SignUPConstants.swift
//  SignUp
//
//  Created by apple on 08/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

func showAlert(message: String, currentVC: UIViewController) {
    let refreshAlert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        return
    }))
    currentVC.present(refreshAlert, animated: true, completion: nil)
}
func showSuccessAlert(message: String, currentVC: UIViewController) {
    let refreshAlert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        return
    }))
    currentVC.present(refreshAlert, animated: true, completion: nil)
}
// Login Requirements . Tell to user that which is optional
public class Login_SignUPRequirements : UIView {
    // set default login View position
    
    var contentView: LoginView?
    
    public var position_Login_View : LoginViewPosition = ._default
    public var isForgotPasswordVisible : Bool = true
    public var loginViewBackgroundColor : UIColor = #colorLiteral(red: 0.4352941176, green: 0.8274509804, blue: 0.9254901961, alpha: 1)
    public override var backgroundColor: UIColor? {
        get {
            return contentView?.backgroundColor
        } set {
            contentView?.backgroundColor = newValue
        }
    }
}

//setting SignUP fields visibility. show only the user selected fields. All fields are optional.

var visibilityCheckForSignUP : [String: Bool] = ["fisrstName":true,
                                                 "lastName":true,
                                                 "email":true,
                                                 "password":true,
                                                 "dob":true,
                                                 "gender":true,
                                                 "mobileNumber":true,
                                                 "address":true,
                                                 "city":true,
                                                 "postalCode":true]

