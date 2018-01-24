//
//  OTPViewController.swift
//  SignUp
//
//  Created by apple on 24/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet var signUPButton: UIButton!
    @IBOutlet var OTPTextField: FloatLabelTextField!
    @IBOutlet var otpView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUPButton.backgroundColor = _buttonBackgroundColor
        // Do any additional setup after loading the view.
    }

    @IBAction func signUP(_ sender: Any) {
        showAlert(message: "SignUP successfull", currentVC: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
