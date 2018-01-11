//
//  LoginViewController.swift
//  SignUp
//
//  Created by apple on 08/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

public enum LoginViewPosition {
    case _top
    case _bottom
    case _left
    case _right
    case _default
}

class LoginViewController: UIViewController {

    @IBOutlet var loginViewWidthCons: NSLayoutConstraint!
    @IBOutlet var loginViewHeightCons: NSLayoutConstraint!
    @IBOutlet var loginLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var loginTopConstraint: NSLayoutConstraint!
    @IBOutlet var loginView: LoginView!
    
    var defaultTopConstraint : CGFloat = 0
    var defaultLeadingConstraint : CGFloat = 0
    var position: LoginViewPosition = ._default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.631372549, blue: 0.8901960784, alpha: 1)]
        self.view.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8274509804, blue: 0.9254901961, alpha: 1)
        loginView.delegate = self
        defaultTopConstraint = self.loginTopConstraint.constant
        defaultLeadingConstraint = self.loginLeadingConstraint.constant
        setPositionOfLoginView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginView.forgotPasswordButton.isHidden = !isForgotPasswordVisible

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func checkValidCredentials(_ userName: String, _ password: String) -> Bool{
        let username = userName.trimmingCharacters(in: .whitespaces)
        let password = password.trimmingCharacters(in: .whitespaces)
        if (username.isEmpty) {
            showAlert(message: "Enter Username", currentVC: self)
            return false
        }
        if (password.isEmpty) {
            showAlert(message: "Enter Password", currentVC: self)
            return false
        }
        if !(username.count > 4) {
            showAlert(message: "Please Enter valid Username", currentVC: self)
            return false

        }
        if !(password.count > 4) {
            showAlert(message: "Please Enter valid Password", currentVC: self)
            return false

        }
        return true
    }
    func setPositionOfLoginView() {
     
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let viewHeight = loginViewHeightCons.constant
        let viewWidth = loginViewWidthCons.constant
        
        switch position {
        case ._top:
            self.loginTopConstraint.constant = 0
            break
        case ._bottom:
            let bottomSpaceValue = screenHeight - (defaultTopConstraint + viewHeight)
            self.loginTopConstraint.constant =  bottomSpaceValue
            break
        case ._left:
            self.loginLeadingConstraint.constant = 0
            break
        case ._right:
            let trailingSpace = screenWidth - (viewWidth + defaultLeadingConstraint)
            self.loginLeadingConstraint.constant = defaultLeadingConstraint + trailingSpace
            break
        default:
            self.loginLeadingConstraint.constant = (screenWidth - viewWidth)/2
            self.loginTopConstraint.constant = (screenHeight - viewHeight)/2
            break
        }
    }
}
extension LoginViewController: SignInDelegate {
    func signingIn(username: String, password: String) {
        let isValidSignIn = self.checkValidCredentials(username, password)
        if isValidSignIn {
            showSuccessAlert(message: "SignIn Successfull", currentVC: self)
        }
    }
    func forgotPassword() {
        let forgotPasswordVC : ForgotPasswordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(forgotPasswordVC, animated: false)
    }
    func register() {
        // move to register screen
        print("register")
        let registrationVC : RegistrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        self.navigationController?.pushViewController(registrationVC, animated: false)
    }
}

