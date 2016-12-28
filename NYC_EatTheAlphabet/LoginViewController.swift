//
//  LoginViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 12/20/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var name = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = retroGrey
        navigationController?.isNavigationBarHidden = true
        setupViews()
     }
    
    func setupViews() {
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none
      }

      // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlphabet" {
            if let destinationVC = segue.destination as? AlphabetTableViewController {
                destinationVC.name = ""
            }
        }
    }
 
}
