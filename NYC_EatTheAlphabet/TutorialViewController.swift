//
//  TutorialViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 12/20/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

   @IBOutlet weak var tutorialButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = retroBlue
         navigationController?.isNavigationBarHidden = true
     }

   
   
   @IBAction func tutorialButtonTapped(_ sender: UIButton) {
     
   }
   

    // MARK: - Navigation

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "showLogin" {
         if let destinationVC = segue.destination as? LoginViewController {
            destinationVC.name = ""
         }
      }
   }

}
