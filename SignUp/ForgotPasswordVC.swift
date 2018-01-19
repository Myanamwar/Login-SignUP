//
//  ForgotPasswordVC.swift
//  SignUp
//
//  Created by apple on 08/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

open class ForgotPasswordVC: UIViewController {
    
    // MARK:- Outlets & Variables
    @IBOutlet var forgotPasswordViewWidthCons: NSLayoutConstraint!
    @IBOutlet var forgotPasswordViewHeightCons: NSLayoutConstraint!
    @IBOutlet var forgotPasswordLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var forgotPasswordTopConstraint: NSLayoutConstraint!
    @IBOutlet var baseView: UIView!
    @IBOutlet var usernameView: UIView!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var reEnterPasswordView: UIView!
    @IBOutlet var reEnterPasswordTextField: UITextField!
    @IBOutlet var setNewPassword: UIButton!

// MARK:- View Life Cycle Methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.setNewPassword.backgroundColor = _buttonBackgroundColor
        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Button Actions
    @IBAction func setNewPassword(_ sender: Any) {
    }
}
