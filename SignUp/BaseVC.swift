//
//  BaseVC.swift
//  SignUp
//
//  Created by apple on 09/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

open class BaseVC: UIViewController {
    
    
    @IBOutlet var loginTypeView: UIView!
    @IBOutlet var signupOptionalFieldsView: UIView!
    // MARK:- Outlets & Variables
    @IBOutlet var selectAllButton: UIButton!
    @IBOutlet var goToSignUpButton: UIButton!
    @IBOutlet var usernameOrPasswordButton: UIButton!
    @IBOutlet var biometricButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginSubViewTopCons: NSLayoutConstraint!// 20
    @IBOutlet var loginSubView: UIView!
    @IBOutlet var loginSubViewHeightCons: NSLayoutConstraint! //120
    @IBOutlet var loginSignUPHeightCOns: NSLayoutConstraint!
    
    // signup fields outlets
    
    @IBOutlet var firstnameButton: UIButton!
    @IBOutlet var lastNameButton: UIButton!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var passwordButton: UIButton!
    @IBOutlet var dobButton: UIButton!
    @IBOutlet var genderButton: UIButton!
    @IBOutlet var mobileNoButton: UIButton!
    @IBOutlet var addressButton: UIButton!
    @IBOutlet var cityButton: UIButton!
    @IBOutlet var postalCodeButton: UIButton!
    
    var isSelectedAll = false
    
    // MARK:- View Life Cycle Methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.2705882353, green: 0.4274509804, blue: 0.5803921569, alpha: 1)]
        self.selectAllButton.setImage(unCheckedImage, for: .normal)
        
        setTitleAndBGColorsForButtons()
    }
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "LoginType"
        self.loginTypeView.isHidden = false
        self.signupOptionalFieldsView.isHidden = true
        self.loginSubView.isHidden = true
        loginSignUPHeightCOns.constant = -140
        loginSubViewTopCons.constant = 0;
        self.loginSubViewHeightCons.constant = 0
        self.loginButton.setImage(unCheckedImage, for: .normal)
        self.signUpButton.setImage(unCheckedImage, for: .normal)
        self.usernameOrPasswordButton.setImage(unCheckedImage, for: .normal)
        self.biometricButton.setImage(unCheckedImage, for: .normal)
        self.showSignUPPage()
        
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK:- Button Actions
    @IBAction func loginClicked(_ sender: Any) {
        self.loginButton.setImage(checkedImage, for: .normal)
        self.signUpButton.setImage(unCheckedImage, for: .normal)
        self.loginSubView.isHidden = false
        loginSignUPHeightCOns.constant = +140
        loginSubViewTopCons.constant = 20; self.loginSubViewHeightCons.constant = 120
        self.signupOptionalFieldsView.isHidden = true

    }
    
    @IBAction func signUPClicked(_ sender: Any) {
//        self.title = "Select SignUP fields"
        self.loginButton.setImage(unCheckedImage, for: .normal)
        self.signUpButton.setImage(checkedImage, for: .normal)
        self.loginSubView.isHidden = true
        loginSignUPHeightCOns.constant = -140
        loginSubViewTopCons.constant = 0; self.loginSubViewHeightCons.constant = 0
        self.loginTypeView.isHidden = true
        self.signupOptionalFieldsView.isHidden = false
    }
    
    @IBAction func biometricLogin(_ sender: Any) {
        self.usernameOrPasswordButton.setImage(unCheckedImage, for: .normal)
        self.biometricButton.setImage(checkedImage, for: .normal)

        self.signupOptionalFieldsView.isHidden = true
        let biometricVC: FingerPrintAccessVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FingerPrintAccessVC") as! FingerPrintAccessVC
        self.navigationController?.pushViewController(biometricVC, animated: false)
    }
    @IBAction func loginViaCredentials(_ sender: Any) {
        self.usernameOrPasswordButton.setImage(checkedImage, for: .normal)
        self.biometricButton.setImage(unCheckedImage, for: .normal)
        self.signupOptionalFieldsView.isHidden = true
        let loginVC: LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
    
    @IBAction func goToSignUPPage(_ sender: Any) {
        
        let registerVC: RegistrationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
        self.navigationController?.pushViewController(registerVC, animated: false)
    }
    @IBAction func checkVisibilityOfAllFields(_ sender: UIButton) {

        var isVisibility = true
        
        switch sender {
        case firstnameButton:
            isVisibility = visibilityCheckForSignUP["firstName"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "firstName")
            
        case lastNameButton:
            isVisibility = visibilityCheckForSignUP["lastName"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "lastName")
        case emailButton:
            isVisibility = visibilityCheckForSignUP["email"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "email")
        case passwordButton:
            isVisibility = visibilityCheckForSignUP["password"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "password")
        case dobButton:
            isVisibility = visibilityCheckForSignUP["dob"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "dob")
        case genderButton:
            isVisibility = visibilityCheckForSignUP["gender"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "gender")
        case mobileNoButton:
            isVisibility = visibilityCheckForSignUP["mobileNumber"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "mobileNumber")
        case addressButton:
            isVisibility = visibilityCheckForSignUP["address"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "address")
        case cityButton:
            isVisibility = visibilityCheckForSignUP["city"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "city")
        case postalCodeButton:
            isVisibility = visibilityCheckForSignUP["postalCode"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "postalCode")
          default:
            break
        }
        if isVisibility {
            sender.setImage(checkedImage, for: .normal)
        } else {
            sender.setImage(unCheckedImage, for: .normal)
        }
        self.showSignUPPage()
    }
    
    @IBAction func selectAllClicked(_ sender: Any) {
        isSelectedAll = !isSelectedAll
        var selectedImage = unCheckedImage
        if isSelectedAll {
            selectedImage = checkedImage
            for (key,_) in visibilityCheckForSignUP {
                visibilityCheckForSignUP[key] = true
            }
        } else {
            selectedImage = unCheckedImage
            for (key,_) in visibilityCheckForSignUP {
                visibilityCheckForSignUP[key] = false
            }
        }
        
        self.firstnameButton.setImage(selectedImage, for: .normal)
        self.lastNameButton.setImage(selectedImage, for: .normal)
        self.emailButton.setImage(selectedImage, for: .normal)
        self.passwordButton.setImage(selectedImage, for: .normal)
        self.dobButton.setImage(selectedImage, for: .normal)
        self.genderButton.setImage(selectedImage, for: .normal)
        self.mobileNoButton.setImage(selectedImage, for: .normal)
        self.addressButton.setImage(selectedImage, for: .normal)
        self.cityButton.setImage(selectedImage, for: .normal)
        self.postalCodeButton.setImage(selectedImage, for: .normal)
        
        self.showSignUPPage()

    }
}
extension BaseVC {
    
    // MARK:- Private Methods
    func showSignUPPage() {
        if (visibilityCheckForSignUP["firstName"]!) || (visibilityCheckForSignUP["lastName"]!) || (visibilityCheckForSignUP["email"]!) || (visibilityCheckForSignUP["password"]!) || (visibilityCheckForSignUP["dob"]!) || (visibilityCheckForSignUP["gender"]!) || (visibilityCheckForSignUP["mobileNumber"]!) || (visibilityCheckForSignUP["address"]!) || (visibilityCheckForSignUP["city"]!) || (visibilityCheckForSignUP["postalCode"]!) {
            
            goToSignUpButton.backgroundColor = _buttonBackgroundColor
            goToSignUpButton.isEnabled = true
        } else {
            goToSignUpButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            goToSignUpButton.isEnabled = false
        }
        if (visibilityCheckForSignUP["firstName"]!) && (visibilityCheckForSignUP["lastName"]!) && (visibilityCheckForSignUP["email"]!) && (visibilityCheckForSignUP["password"]!) && (visibilityCheckForSignUP["dob"]!) && (visibilityCheckForSignUP["gender"]!) && (visibilityCheckForSignUP["mobileNumber"]!) && (visibilityCheckForSignUP["address"]!) && (visibilityCheckForSignUP["city"]!) && (visibilityCheckForSignUP["postalCode"]!) {
            self.isSelectedAll = true
            self.selectAllButton.setImage(checkedImage, for: .normal)
        } else {
            self.isSelectedAll = false
            self.selectAllButton.setImage(unCheckedImage, for: .normal)
        }
    }
    func setTitleAndBGColorsForButtons(){
        
        self.loginTypeView.backgroundColor = _backgroundColor
        self.signupOptionalFieldsView.backgroundColor = _backgroundColor
        self.loginButton.titleLabel?.textColor = _textColor
        self.usernameOrPasswordButton.titleLabel?.textColor = _textColor
        self.biometricButton.titleLabel?.textColor = _textColor
        self.signUpButton.titleLabel?.textColor = _textColor
        self.firstnameButton.titleLabel?.textColor = _textColor
        self.lastNameButton.titleLabel?.textColor = _textColor
        self.emailButton.titleLabel?.textColor = _textColor
        self.passwordButton.titleLabel?.textColor = _textColor
        self.dobButton.titleLabel?.textColor = _textColor
        self.genderButton.titleLabel?.textColor = _textColor
        self.mobileNoButton.titleLabel?.textColor = _textColor
        self.addressButton.titleLabel?.textColor = _textColor
        self.cityButton.titleLabel?.textColor = _textColor
        self.postalCodeButton.titleLabel?.textColor = _textColor
        self.goToSignUpButton.backgroundColor = _buttonBackgroundColor
        
    }
}
