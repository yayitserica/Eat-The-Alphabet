//
//  AlphabetTableViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/7/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit

class AlphabetTableViewController: UITableViewController {

    //MARK: This is where I create my restaurant array
    var alphabet:[String:(String, String, String)] = [
        "A": ("American", "Jackson Hole", "america"),
        "B": ("Belgian", "BXL Zoute", "belgium"),
        "C": ("Chinese", "Grand Sichuan", "china"),
        "D": ("Dim Sum", "Jing Fong", "dimsum"),
        "E": ("Ethopian", "Meskerem", "ethiopia"),
        "F": ("French", "Le Pain Quotidien", "france"),
        "G": ("Greek", "Village Taverna", "greece"),
        "H": ("Hungarian", "Budapest Cafe", "hungary"),
        "I": ("Israeli", "Nanoosh", "israel"),
        "J": ("Japanese", "Haru Sushi", "japan"),
        "K": ("Korean", "BCD Tofu House", "korea"),
        "L": ("Lebanese","Au Za'atar", "lebanon"),
        "M": ("Moroccan", "Cafe Mogador", "morocco"),
        "N": ("Nepali", "Mustang Thakali Kitchen", "nepal"),
        "O": ("Österreich (Austrian)", "Cafe Kayja", "austria"),
        "P": ("Pilipino", "Krystal's Cafe & Pastry Shop", "philippines"),
        "Q": ("Quito (Ecuador)", "Sabor Latino", "ecuador"),
        "R": ("Russian", "Onegin", "russia"),
        "S": ("Singaporean", "Chomp Chomp", "singapore"),
        "T": ("Turkish", "Turkish Kitchen", "turkey"),
        "U": ("Ukranian", "Veselka", "ukraine"),
        "V": ("Vegan", "Franchia", "vegan"),
        "W": ("Whole Foods", "Whole Foods Market", "wholefoods"),
        "X": ("TBD", "TBD", "plateSetting"),
        "Y": ("TBD", "TBD", "plateSetting"),
        "Z": ("TBD", "TBD", "plateSetting")]
  
  var alphabetArray:[[String:(String, String, String)]] = [
      ["A": ("American", "Jackson Hole", "america")],
      ["B": ("Belgian", "BXL Zoute", "belgium")],
      ["C": ("Chinese", "Grand Sichuan", "china")],
      ["D": ("Dim Sum", "Jing Fong", "dimsum")],
      ["E": ("Ethopian", "Meskerem", "ethiopia")],
      ["F": ("French", "Le Pain Quotidien", "france")],
      ["G": ("Greek", "Village Taverna", "greece")],
      ["H": ("Hungarian", "Budapest Cafe", "hungary")],
      ["I": ("Israeli", "Nanoosh", "israel")],
      ["J": ("Japanese", "Haru Sushi", "japan")],
      ["K": ("Korean", "BCD Tofu House", "korea")],
      ["L": ("Lebanese","Au Za'atar", "lebanon")],
      ["M": ("Moroccan", "Cafe Mogador", "morocco")],
      ["N": ("Nepali", "Mustang Thakali Kitchen", "nepal")],
      ["O": ("Österreich (Austrian)", "Cafe Kayja", "austria")],
      ["P": ("Pilipino", "Krystal's Cafe & Pastry Shop", "philippines")],
      ["Q": ("Quito (Ecuador)", "Sabor Latino", "ecuador")],
      ["R": ("Russian", "Onegin", "russia")],
      ["S": ("Singaporean", "Chomp Chomp", "singapore")],
      ["T": ("Turkish", "Turkish Kitchen", "turkey")],
      ["U": ("Ukranian", "Veselka", "ukraine")],
      ["V": ("Vegan", "Franchia", "vegan")],
      ["W": ("Whole Foods", "Whole Foods Market", "wholefoods")],
      ["X": ("TBD", "TBD", "plateSetting")],
      ["Y": ("TBD", "TBD", "plateSetting")],
      ["Z": ("TBD", "TBD", "plateSetting")]
  ]
  
  
    struct RestaurantObjects {
        var restaurantLetter : String!
        var restaurantCuisine : (String, String, String)!
    }
    
    var restaurantArray = [RestaurantObjects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = retroCoral
      
        for (letter, cuisine) in alphabet {
             restaurantArray.append(RestaurantObjects(restaurantLetter: letter, restaurantCuisine: cuisine))
         }
     }

    // MARK: - Table view data source
     override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return restaurantArray.count
         return 26
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! AlphabetCell
      
        if let letterForLabel = restaurantArray[indexPath.row].restaurantLetter {
            cell.letterLabel.text = String(letterForLabel)
        }
        if let imageForLabel = restaurantArray[indexPath.row].restaurantCuisine {
            cell.imageLabel.image = UIImage(named: imageForLabel.2)
        }
        return cell
    }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      cell.backgroundColor = retroGrey
  }
  
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "toRestaurant" { return }
            if let dest = segue.destination as? RestaurantViewController, let indexPath = tableView.indexPathForSelectedRow {
//                print(dest)
                print(indexPath)
                dest.cuisineName = restaurantArray[indexPath.row].restaurantCuisine.0
//                print(dest.cuisineName)
                dest.restaurantName = restaurantArray[indexPath.row].restaurantCuisine.1
//                print(dest.restaurantName)
            }
    }
}
 




















