//
//  RegistrationVC.swift
//  SignUp
//
//  Created by apple on 09/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet var scrollView: UIScrollView!
    
    
    @IBOutlet var firstNameView: UIView!
    @IBOutlet var lastNameView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordView: UIView!
    @IBOutlet var dobView: UIView!
    @IBOutlet var genderView: UIView!
    @IBOutlet var phoneView: UIView!
    @IBOutlet var addressView: UIView!
    @IBOutlet var cityView: UIView!
    @IBOutlet var postalCodeView: UIView!

    
    @IBOutlet var firstNameHeightCons: NSLayoutConstraint!
    @IBOutlet var firstNameTopCons: NSLayoutConstraint!//20
    
    @IBOutlet var lastNameHeightCons: NSLayoutConstraint!//65
    @IBOutlet var lastNameTopCons: NSLayoutConstraint!//5
    
    @IBOutlet var emailHeightCons: NSLayoutConstraint!
    @IBOutlet var emailTopCons: NSLayoutConstraint!
    
    @IBOutlet var passwordHeightCons: NSLayoutConstraint!
    @IBOutlet var passwordTopCons: NSLayoutConstraint!
    
    @IBOutlet var dobHeightCons: NSLayoutConstraint!
    @IBOutlet var dobTopCons: NSLayoutConstraint!
    
    @IBOutlet var genderHeightCons: NSLayoutConstraint!
    @IBOutlet var genderTopCons: NSLayoutConstraint!
    
    @IBOutlet var mobileNoHeightCons: NSLayoutConstraint!
    @IBOutlet var mobileNoTopCons: NSLayoutConstraint!
    
    @IBOutlet var addressHeightCons: NSLayoutConstraint!// 90
    @IBOutlet var addressTopCons: NSLayoutConstraint!
    
    @IBOutlet var cityHeightCons: NSLayoutConstraint!
    @IBOutlet var cityTopCons: NSLayoutConstraint!
    
    @IBOutlet var postalCodeHeightCons: NSLayoutConstraint!
    @IBOutlet var postalCodeTopCons: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showValidFields()
        
    }
    func showValidFields(){

        let isVisibleFirstName = visibilityCheckForSignUP["fisrstName"]!
        let isVisibleLastName = visibilityCheckForSignUP["lastName"]!
        let isVisibleEmail = visibilityCheckForSignUP["email"]!
        let isVisiblePassword = visibilityCheckForSignUP["password"]!
        let isVisibleDOB = visibilityCheckForSignUP["dob"]!
        let isVisibleGender = visibilityCheckForSignUP["gender"]!
        let isVisibleMobileNo = visibilityCheckForSignUP["mobileNumber"]!
        let isVisibleAddress = visibilityCheckForSignUP["address"]!
        let isVisibleCity = visibilityCheckForSignUP["city"]!
        let isVisiblePostalCode = visibilityCheckForSignUP["postalCode"]!
        
        if isVisibleFirstName {
            self.firstNameHeightCons.constant = 65
            self.firstNameTopCons.constant = 20
            self.firstNameView.isHidden = false
        } else {
            self.firstNameHeightCons.constant = 0
            self.firstNameTopCons.constant = 15
            self.firstNameView.isHidden = true

        }
        if isVisibleLastName {
            self.lastNameHeightCons.constant = 65
            self.lastNameTopCons.constant = 5
            self.lastNameView.isHidden = false

        } else {
            self.lastNameHeightCons.constant = 0
            self.lastNameTopCons.constant = 0
            self.lastNameView.isHidden = true

        }
        if isVisibleEmail {
            self.emailHeightCons.constant = 65
            self.emailTopCons.constant = 5
            self.emailView.isHidden = false

        } else {
            self.emailHeightCons.constant = 0
            self.emailTopCons.constant = 0
            self.emailView.isHidden = true

        }
        if isVisiblePassword {
            self.passwordHeightCons.constant = 65
            self.passwordTopCons.constant = 5
            self.passwordView.isHidden = false

        } else {
            self.passwordHeightCons.constant = 0
            self.passwordTopCons.constant = 0
            self.passwordView.isHidden = true

        }
        if isVisibleDOB {
            self.dobHeightCons.constant = 65
            self.dobTopCons.constant = 5
            self.dobView.isHidden = false

        } else {
            self.dobHeightCons.constant = 0
            self.dobTopCons.constant = 0
            self.dobView.isHidden = true

        }
        if isVisibleGender {
            self.genderHeightCons.constant = 65
            self.genderTopCons.constant = 5
            self.genderView.isHidden = false

        } else {
            self.genderHeightCons.constant = 0
            self.genderTopCons.constant = 0
            self.genderView.isHidden = true

        }
        if isVisibleMobileNo {
            self.mobileNoHeightCons.constant = 65
            self.mobileNoTopCons.constant = 5
            self.phoneView.isHidden = false

        } else {
            self.mobileNoHeightCons.constant = 0
            self.mobileNoTopCons.constant = 0
            self.phoneView.isHidden = true

        }
        if isVisibleAddress {
            self.addressHeightCons.constant = 90
            self.addressTopCons.constant = 5
            self.addressView.isHidden = false

        } else {
            self.addressHeightCons.constant = 0
            self.addressTopCons.constant = 0
            self.addressView.isHidden = true

        }
        if isVisibleCity {
            self.cityHeightCons.constant = 65
            self.cityTopCons.constant = 5
            self.cityView.isHidden = false

        } else {
            self.cityHeightCons.constant = 0
            self.cityTopCons.constant = 0
            self.cityView.isHidden = true

        }
        if isVisiblePostalCode {
            self.postalCodeHeightCons.constant = 65
            self.postalCodeTopCons.constant = 5
            self.postalCodeView.isHidden = false

        } else {
            self.postalCodeHeightCons.constant = 0
            self.postalCodeTopCons.constant = 0
            self.postalCodeView.isHidden = true

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLayoutSubviews() {
//        self.scrollView.contentSize = CGSize(width: 375, height: 760)

    }
    
}
class CustomTextField: UITextField {
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 0)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 0)
    }
}
