//
//  RestaurantViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/7/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var cuisineLabel: UILabel!

    @IBOutlet weak var restaurantLabel: UILabel!
    
    var cuisineName: String = ""
    var restaurantName: String = ""
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0)
        print(cuisineName)
        cuisineLabel.text = cuisineName
        restaurantLabel.text = restaurantName
        navigationItem.title = cuisineName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
