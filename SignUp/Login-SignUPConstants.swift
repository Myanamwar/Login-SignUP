//
//  Login-SignUPConstants.swift
//  SignUp
//
//  Created by apple on 08/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import UIKit

// showing alert with message
func showAlert(message: String, currentVC: UIViewController) {
    let refreshAlert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
        return
    }))
    currentVC.present(refreshAlert, animated: true, completion: nil)
}

// change background color
public var _backgroundColor : UIColor = #colorLiteral(red: 0.4352941176, green: 0.8274509804, blue: 0.9254901961, alpha: 1)

// change text color
public var _textColor : UIColor = #colorLiteral(red: 0.337254902, green: 0.4823529412, blue: 0.7843137255, alpha: 1)

public var _labelTextColor : UIColor = #colorLiteral(red: 0, green: 0.631372549, blue: 0.8901960784, alpha: 1)

// change button background color
public var _buttonBackgroundColor : UIColor = #colorLiteral(red: 0, green: 0.2862745098, blue: 0.5058823529, alpha: 1)

// change cheked & unChecked Images if you want
public var checkedImage : UIImage = #imageLiteral(resourceName: "checked")
public var unCheckedImage : UIImage = #imageLiteral(resourceName: "unchecked")

// change position to top, left, bottom, right if you want. By default it is in the middle of screen
public var positionOfLoginView : ViewPosition = ._default

//setting SignUP fields visibility. show only the user selected fields. All fields are optional.
public var visibilityCheckForSignUP : [String: Bool] = ["firstName":true,
                                                 "lastName":true,
                                                 "email":true,
                                                 "password":true,
                                                 "dob":true,
                                                 "gender":true,
                                                 "mobileNumber":true,
                                                 "address":true,
                                                 "city":true,
                                                 "postalCode":true]

// Make it false if you don't want to show forgotPassword button in login page
public var isForgotPasswordVisible = true
public var isResisterButtonVisible = true



