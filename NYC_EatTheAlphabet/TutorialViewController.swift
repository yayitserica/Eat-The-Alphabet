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
    @IBOutlet weak var backgroundImageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = retroBlue
        navigationController?.isNavigationBarHidden = true
        setupBackgroundImage()
        formatButton()
     }

    func setupBackgroundImage() {
        let backgroundImage = UIImage(named: "tableEating")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = backgroundImage
        backgroundImageView.alpha = 0.85
    }
    
    func formatButton() {
//        tutorialButton.backgroundColor = retroGrey
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
