//
//  AlphabetTableViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/7/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit

class AlphabetTableViewController: UITableViewController {
    
    var name = ""

    //MARK: This is where I create my restaurant array
   
    struct RestaurantObjects {
        var restaurantLetter : String!
        var restaurantCuisine : (String, String, String)!
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = retroGrey
        navigationController?.isNavigationBarHidden = true
        
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - Table view data source
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 26
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! AlphabetCell
        
        let letterDict = alphabetArray[indexPath.row]
        for (key, value) in letterDict {
            cell.letterLabel.text = key
            cell.suggestedCuisineLabel.text = value.0
        }
        
        return cell
    }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      cell.backgroundColor = retroGrey
  }
  
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "toRestaurant" { return }
            if let dest = segue.destination as? RestaurantViewController, let indexPath = tableView.indexPathForSelectedRow {
                
                for (key, value) in alphabetArray[indexPath.row] {
//                    dest.cuisineName = value.0
//                    dest.restaurantName = value.1
                    dest.cuisineName = "Click to edit cuisine"
                    dest.restaurantName = "Click to edit restaurant"
                }
            }
    }
}
 




















