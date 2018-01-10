//
//  BaseVC.swift
//  SignUp
//
//  Created by apple on 09/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    @IBOutlet var goToSignUpButton: UIButton!
    @IBOutlet var usernameOrPasswordButton: UIButton!
    @IBOutlet var biometricButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginSubViewTopCons: NSLayoutConstraint!// 20
    @IBOutlet var loginSubView: UIView!
    @IBOutlet var loginSubViewHeightCons: NSLayoutConstraint! //120
    @IBOutlet var loginSignUPView: UIView!
    @IBOutlet var signUPView: UIView!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Login/SignUP"
        self.loginSignUPView.isHidden = false
        self.signUPView.isHidden = true
        self.loginSubView.isHidden = true
        loginSignUPHeightCOns.constant = -140
        loginSubViewTopCons.constant = 0;
        self.loginSubViewHeightCons.constant = 0
        self.loginButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.signUpButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.usernameOrPasswordButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.biometricButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        
        self.showSignUPPage()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        self.loginButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        self.signUpButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.loginSubView.isHidden = false
        loginSignUPHeightCOns.constant = +140
        loginSubViewTopCons.constant = 20; self.loginSubViewHeightCons.constant = 120
        self.signUPView.isHidden = true

    }
    
    @IBAction func signUPClicked(_ sender: Any) {
        self.loginButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.signUpButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        self.loginSubView.isHidden = true
        loginSignUPHeightCOns.constant = -140
        loginSubViewTopCons.constant = 0; self.loginSubViewHeightCons.constant = 0
        self.loginSignUPView.isHidden = true
        self.signUPView.isHidden = false
    }
    
    @IBAction func biometricLogin(_ sender: Any) {
        self.usernameOrPasswordButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        self.biometricButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)

        self.signUPView.isHidden = true
        let biometricVC: FingerPrintAccessVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FingerPrintAccessVC") as! FingerPrintAccessVC
        self.navigationController?.pushViewController(biometricVC, animated: false)
    }
    @IBAction func loginViaCredentials(_ sender: Any) {
        self.usernameOrPasswordButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        self.biometricButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)

        self.signUPView.isHidden = true
        let loginVC: ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
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
            isVisibility = visibilityCheckForSignUP["fisrstName"]!
            isVisibility = !(isVisibility)
            visibilityCheckForSignUP.updateValue(isVisibility, forKey: "fisrstName")
            
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
            sender.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        
        self.showSignUPPage()

    }
    func showSignUPPage() {
        if (visibilityCheckForSignUP["fisrstName"]!) || (visibilityCheckForSignUP["lastName"]!) || (visibilityCheckForSignUP["email"]!) || (visibilityCheckForSignUP["password"]!) || (visibilityCheckForSignUP["dob"]!) || (visibilityCheckForSignUP["gender"]!) || (visibilityCheckForSignUP["mobileNumber"]!) || (visibilityCheckForSignUP["address"]!) || (visibilityCheckForSignUP["city"]!) || (visibilityCheckForSignUP["postalCode"]!) {
            
            goToSignUpButton.backgroundColor = #colorLiteral(red: 0, green: 0.2862745098, blue: 0.5058823529, alpha: 1)
            goToSignUpButton.isEnabled = true
        } else {
            goToSignUpButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            goToSignUpButton.isEnabled = false
        }
    }
}
