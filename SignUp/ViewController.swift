//
//  ViewController.swift
//  SignUp
//
//  Created by apple on 05/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var positionTableView: UITableView!
    
    let positions : [LoginViewPosition] = [._top, ._bottom, ._left, ._right, ._default]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select any View Position"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.631372549, blue: 0.8901960784, alpha: 1)]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = "\(positions[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let requirements = Login_SignUPRequirements()
        
        switch  indexPath.row {
        case 0:
            requirements.position_Login_View = ._top
            break
        case 1:
            requirements.position_Login_View = ._bottom
            break
        case 2:
            requirements.position_Login_View = ._left
            break
        case 3:
            requirements.position_Login_View = ._right
            break
        default:
            requirements.position_Login_View = ._default
            break
        }
        let loginVC: LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.position = requirements.position_Login_View
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
}

