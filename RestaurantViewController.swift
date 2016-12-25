//
//  RestaurantViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/7/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var restaurantMap: MKMapView!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    var cuisineName: String = ""
    var restaurantName: String = ""
    
    var alreadyZoomedIn = false
    
    let titosLat:Double = 34.0082
    let titosLong: Double = 118.4145
    
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
        navigationItem.title = "Click Item to Edit"
        navigationController?.isNavigationBarHidden = false
        
        //sets up map
        restaurantMap.delegate = self
        setupMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupMap() {
        let coordinate = CLLocationCoordinate2D(latitude: titosLat, longitude: titosLong)
        
        restaurantMap.isZoomEnabled = true
        restaurantMap.setCenter(coordinate, animated: true)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        restaurantMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Tito's Tacos"
        restaurantMap.addAnnotation(annotation)
        
        //gesture recognizers
        cuisineLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setCuisine)))
        cuisineLabel.isUserInteractionEnabled = true
        
        restaurantLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setRestaurant)))
        restaurantLabel.isUserInteractionEnabled = true
        
        friendsLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setFriends)))
        friendsLabel.isUserInteractionEnabled = true
        
        foodLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setFood)))
        foodLabel.isUserInteractionEnabled = true
        
    }
    
    //MARK: - gesture/edit view methods
    func setCuisine() {
        
        let enterCuisineAlert = UIAlertController(title: "Enter Cuisine", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("User cancelled in enterCuisineAlertController")
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            print("User pushed 'DONE' on enterCuisineAlertController")
            let cuisineField = enterCuisineAlert.textFields![0] as UITextField
            print("the user entered \(cuisineField)")
            guard let cuisine = cuisineField.text else { return }
            
            //TODO: - save this cuisine below to 1) core data and 2) have it persist on the screen
            self.cuisineLabel.text = cuisine
        }
        
        enterCuisineAlert.addTextField { (textField) in
            textField.placeholder = "Cuisine type"
        }
        enterCuisineAlert.addAction(cancelAction)
        enterCuisineAlert.addAction(doneAction)
        
        self.present(enterCuisineAlert, animated: true, completion: nil)
        
    }
    
    func setRestaurant() {
        let enterRestaurantAlert = UIAlertController(title: "Enter Restaurant", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("User cancelled in enterCuisineAlertController")
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            print("User pushed 'DONE' on enterRestaurantAlertController")
            let restaurantField = enterRestaurantAlert.textFields![0] as UITextField
            print("the user entered \(restaurantField)")
            guard let restaurant = restaurantField.text else { return }
            
            //TODO: - save this cuisine below to 1) core data and 2) have it persist on the screen
            self.restaurantLabel.text = restaurant
        }
        
        enterRestaurantAlert.addTextField { (textField) in
            textField.placeholder = "Restaurant Name"
        }
        enterRestaurantAlert.addAction(cancelAction)
        enterRestaurantAlert.addAction(doneAction)
        
        self.present(enterRestaurantAlert, animated: true, completion: nil)
    }
    
    func setFriends() {
        let enterFriendsAlert = UIAlertController(title: "Enter Friends", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("User cancelled in enterFriendsAlertController")
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            print("User pushed 'DONE' on enterCuisineAlertController")
            let friendsField = enterFriendsAlert.textFields![0] as UITextField
            print("the user entered \(friendsField)")
            guard let friends = friendsField.text else { return }
            
            //TODO: - save this cuisine below to 1) core data and 2) have it persist on the screen
            self.friendsLabel.text = friends
        }
        
        enterFriendsAlert.addTextField { (textField) in
            textField.placeholder = "Enter Friend(s) Names"
        }
        enterFriendsAlert.addAction(cancelAction)
        enterFriendsAlert.addAction(doneAction)
        
        self.present(enterFriendsAlert, animated: true, completion: nil)
    }
    
    func setFood() {
        let setFoodAlert = UIAlertController(title: "Enter Food", message: "What'd you eat?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("User cancelled in setFoodAlertController")
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            print("User pushed 'DONE' on setFoodAlertController")
            let setFoodField = setFoodAlert.textFields![0] as UITextField
            print("the user entered \(setFoodField)")
            guard let foods = setFoodField.text else { return }
            
            //TODO: - save this cuisine below to 1) core data and 2) have it persist on the screen
            self.foodLabel.text = foods
        }
        
        setFoodAlert.addTextField { (textField) in
            textField.placeholder = "Foods"
        }
        setFoodAlert.addAction(cancelAction)
        setFoodAlert.addAction(doneAction)
        
        self.present(setFoodAlert, animated: true, completion: nil)
    }
    
    //MARK: - MapView methods
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let viewAnnotation = view.annotation else { return }
        let placemark = MKPlacemark(coordinate: viewAnnotation.coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        let launchOptions: NSDictionary = NSDictionary(object: MKLaunchOptionsDirectionsModeWalking, forKey: MKLaunchOptionsDirectionsModeKey as NSCopying)
        mapItem.openInMaps(launchOptions: launchOptions as? [String:Any])
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if !alreadyZoomedIn {
            zoomInOnCurrentLocation()
            alreadyZoomedIn = true
        }
    }
    
    func zoomInOnCurrentLocation() {
        let userCoordinate = restaurantMap.userLocation.coordinate
        let latDeltaDegrees: CLLocationDegrees = 0.03
        let longDeltaDegrees: CLLocationDegrees = 0.03
        let userSpan = MKCoordinateSpanMake(latDeltaDegrees, longDeltaDegrees)
        let userRegion = MKCoordinateRegionMake(userCoordinate, userSpan)
        restaurantMap.setRegion(userRegion, animated: true)
    }
    
    

}
