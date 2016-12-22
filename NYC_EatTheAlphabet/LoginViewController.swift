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

    
    
    

    /*
    // MARK: - Navigation

     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
