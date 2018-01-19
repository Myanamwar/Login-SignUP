//
//  ViewController.swift
//  SignUp
//
//  Created by apple on 05/01/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

open class ViewController: UIViewController {
    
    // MARK:- Outlets and Variables
    @IBOutlet var positionTableView: UITableView!
    let positions : [ViewPosition] = [._top, ._bottom, ._left, ._right, ._default]
    
    // MARK:- View Life Cycle Methods
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select any View Position"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.631372549, blue: 0.8901960784, alpha: 1)]
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
// MARK:- Tableview Delegate and Datasource methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = "\(positions[indexPath.row])"
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch  indexPath.row {
        case 0:
            positionOfLoginView = ._top
            break
        case 1:
            positionOfLoginView = ._bottom
            break
        case 2:
            positionOfLoginView = ._left
            break
        case 3:
            positionOfLoginView = ._right
            break
        default:
            positionOfLoginView = ._default
            break
        }
        let loginVC: LoginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
}

