//
//  LoginView.swift
//  SignUp
//
//  Created by apple on 08/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

@objc protocol SignInDelegate: class {
    func signingIn(username: String, password: String)
    @objc optional func register()
    @objc optional func forgotPassword()
}

open class LoginView: UIView {
    
    // MARK:- Outlets & Variables
    
    @IBOutlet var baseView: UIView!
    @IBOutlet var view: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var usernameView: UIView!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButtton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    weak var delegate: SignInDelegate?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.signInButtton.backgroundColor = _buttonBackgroundColor
        
        let yourAttributes : [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17),
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
        
        let forgot_attributeString = NSMutableAttributedString(string: "Forgot Password?",
                                                               attributes: yourAttributes)
        let register_attributeString = NSMutableAttributedString(string: "Register?",
                                                                 attributes: yourAttributes)
        forgotPasswordButton.setAttributedTitle(forgot_attributeString, for: .normal)
        registerButton.setAttributedTitle(register_attributeString, for: .normal)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    // MARK:- Button Actions
    @IBAction func signIn(_ sender: Any) {
        
        let delegate = self.delegate;
        delegate?.signingIn(username: self.userNameTextField.text!, password: self.passwordTextField.text!)
    }
    
    @IBAction func register(_ sender: Any) {
        delegate?.register!()
    }
    @IBAction func forgotPassword(_ sender: Any) {
        delegate?.forgotPassword!()
    }
}
