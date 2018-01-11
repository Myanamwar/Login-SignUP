//
//  FingerPrintAccessVC.swift
//  SignUp
//
//  Created by apple on 09/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import LocalAuthentication

class FingerPrintAccessVC: UIViewController {
    
    var context = LAContext()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var refresh: UIButton!
    
    let kMsgShowFinger = "Show me your finger 👍"
    let kMsgShowReason = "🌛 Try to dismiss this screen 🌜"
    let kMsgFingerOK = "Login successful! ✅"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    @objc func updateUI() {
        var policy: LAPolicy?
        var err: NSError?
        // Depending the iOS version we'll need to choose the policy we are able to use
        if #available(iOS 9.0, *) {
            // iOS 9+ users with Biometric and Passcode verification
            policy = .deviceOwnerAuthentication
            policy = (context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error:&err) ? LAPolicy.deviceOwnerAuthenticationWithBiometrics : LAPolicy.deviceOwnerAuthentication)
        } else {
            // iOS 8+ users with Biometric and Custom (Fallback button) verification
            context.localizedFallbackTitle = "Fuu!"
            policy = .deviceOwnerAuthenticationWithBiometrics
        }
        
        // Check if the user is able to use the policy we've selected previously

        guard context.canEvaluatePolicy(policy!, error: &err) else {
            image.image = UIImage(named: "TouchID_off")
            // Print the localized message received by the system
            message.text = err?.localizedDescription
            return
        }
        
        image.image = UIImage(named: "TouchID_on")
        message.text = kMsgShowFinger
        loginProcess(policy: policy!)
    }
    
    private func setupController() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(FingerPrintAccessVC.updateUI), name: .UIApplicationWillEnterForeground, object: nil)
        
        // The Refresh button will let us to repeat the login process so many times as we want
        refresh.alpha = 0
    }
    private func loginProcess(policy: LAPolicy) {
        // Start evaluation process with a callback that is executed when the user ends the process successfully or not
        context.evaluatePolicy(policy, localizedReason: kMsgShowReason, reply: { (success, error) in
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.5, animations: {
                    self.refresh.alpha = 1
                })
                
                guard success else {
                    guard let error = error else {
                        self.showUnexpectedErrorMessage()
                        return
                    }
                    switch(error) {
                    case LAError.authenticationFailed:
                        self.message.text = "There was a problem verifying your identity."
                    case LAError.userCancel:
                        self.message.text = "Authentication was canceled by user."
                    case LAError.userFallback:
                        self.message.text = "The user tapped the fallback button (Fuu!)"
                    case LAError.systemCancel:
                        self.message.text = "Authentication was canceled by system."
                    case LAError.passcodeNotSet:
                        self.message.text = "Passcode is not set on the device."
                    case LAError.biometryNotAvailable:
                        self.message.text = "Touch ID is not available on the device."
                    case LAError.biometryNotEnrolled:
                        self.message.text = "Touch ID has no enrolled fingers."
                    // iOS 9+ functions
                    case LAError.biometryLockout:
                        self.message.text = "There were too many failed Touch ID attempts and Touch ID is now locked."
                    case LAError.appCancel:
                        self.message.text = "Authentication was canceled by application."
                    case LAError.invalidContext:
                        self.message.text = "LAContext passed to this call has been previously invalidated."
                    // MARK: IMPORTANT: There are more error states, take a look into the LAError struct
                    default:
                        self.message.text = "Touch ID may not be configured"
                        break
                    }
                    return
                }
                
                // Good news! Everything went fine 👏
                self.message.text = self.kMsgFingerOK
            }
        })}
    private func showUnexpectedErrorMessage() {
        image.image = UIImage(named: "TouchID_off")
        message.text = "Unexpected error! 😱"
    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    // MARK: IBAction Functions 
    
    @IBAction func resetContextState(_ sender: UIButton) {
        context = LAContext()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.refresh.alpha = 0
        })
        
        updateUI()
    }
}
