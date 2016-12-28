//
//  RestaurantViewController.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 10/7/16.
//  Copyright © 2016 Erica Millado. All rights reserved.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController, MKMapViewDelegate, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
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
    
    var userChoseImage:Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0)
        view.backgroundColor = retroGrey
        print(cuisineName)
        cuisineLabel.text = cuisineName
        restaurantLabel.text = restaurantName
        navigationController?.isNavigationBarHidden = false
        
        //sets up map
        restaurantMap.delegate = self
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupViews() {
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
        
        dateLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setDate)))
        dateLabel.isUserInteractionEnabled = true
        
        foodImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectProfileImage)))
        foodImage.isUserInteractionEnabled = true
        
    }
    
    //MARK: - gesture/edit view methods
    func setCuisine() {
        
        let enterCuisineAlert = UIAlertController(title: "Enter Cuisine", message: "", preferredStyle: .alert)
        
        let enterCuisineString  = "What Cuisine Did You Try?"
        var myMutableString = NSMutableAttributedString(string: enterCuisineString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 20.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: retroBlue, range: NSRange(location:0,length:enterCuisineString.characters.count))
        enterCuisineAlert.setValue(myMutableString, forKey: "attributedTitle")
        
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
            textField.textAlignment = .center
            textField.font = UIFont(name: "CJPotterHandwriting", size: 12.0)
        }
        enterCuisineAlert.addAction(cancelAction)
        enterCuisineAlert.addAction(doneAction)
        
        self.present(enterCuisineAlert, animated: true, completion: nil)
        
    }
    
    func setRestaurant() {
        let enterRestaurantAlert = UIAlertController(title: "Enter Restaurant", message: "", preferredStyle: .alert)
        
        let enterRestaurantString  = "Where'd you eat?"
        var myMutableString = NSMutableAttributedString(string: enterRestaurantString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 20.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: retroBlue, range: NSRange(location:0,length:enterRestaurantString.characters.count))
        enterRestaurantAlert.setValue(myMutableString, forKey: "attributedTitle")
        
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
            textField.textAlignment = .center
            textField.font = UIFont(name: "CJPotterHandwriting", size: 12.0)
        }
        enterRestaurantAlert.addAction(cancelAction)
        enterRestaurantAlert.addAction(doneAction)
        
        self.present(enterRestaurantAlert, animated: true, completion: nil)
    }
    
    func setFriends() {
        let enterFriendsAlert = UIAlertController(title: "Enter Friends", message: "", preferredStyle: .alert)
        
        let enterFriendsString  = "Who'd you eat with?"
        var myMutableString = NSMutableAttributedString(string: enterFriendsString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 20.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: retroBlue, range: NSRange(location:0,length:enterFriendsString.characters.count))
        enterFriendsAlert.setValue(myMutableString, forKey: "attributedTitle")
        
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
            textField.textAlignment = .center
            textField.font = UIFont(name: "CJPotterHandwriting", size: 12.0)
        }
        enterFriendsAlert.addAction(cancelAction)
        enterFriendsAlert.addAction(doneAction)
        
        self.present(enterFriendsAlert, animated: true, completion: nil)
    }
    
    func setFood() {
        
        let setFoodAlert = UIAlertController(title: "Enter Food", message: "What'd you eat?", preferredStyle: .alert)
        
        let enterFoodString  = "Enter Meal"
        var myMutableString = NSMutableAttributedString(string: enterFoodString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 20.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: retroDarkRed, range: NSRange(location:0,length:enterFoodString.characters.count))
        setFoodAlert.setValue(myMutableString, forKey: "attributedTitle")
        
        let messageString  = "What'd you eat?"
        var mutableMessageString = NSMutableAttributedString(string: messageString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 14.0)!])
        mutableMessageString.addAttribute(NSForegroundColorAttributeName, value: retroBlue, range: NSRange(location:0,length:messageString.characters.count))
        setFoodAlert.setValue(mutableMessageString, forKey: "attributedMessage")
        
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
            textField.placeholder = "Food"
            textField.textAlignment = .center
            textField.font = UIFont(name: "CJPotterHandwriting", size: 12.0)
        }
        setFoodAlert.addAction(cancelAction)
        setFoodAlert.addAction(doneAction)
        
        self.present(setFoodAlert, animated: true, completion: nil)
    }
    
    func setDate() {
        let setDateAlert = UIAlertController(title: "When did you dine?", message: "", preferredStyle: .alert)
        
        let enterFoodString  = "When did you dine?"
        var myMutableString = NSMutableAttributedString(string: enterFoodString as String, attributes: [NSFontAttributeName:UIFont(name: "CJPotterHandwriting", size: 20.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: retroBlue, range: NSRange(location:0,length:enterFoodString.characters.count))
        setDateAlert.setValue(myMutableString, forKey: "attributedTitle")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("User cancelled in setDateAlertController")
        }
        
        let doneAction = UIAlertAction(title: "Done", style: .default) { (action) in
            print("User pushed 'DONE' on enterCuisineAlertController")
            let dateField = setDateAlert.textFields![0] as UITextField
            print("the user entered \(dateField)")
            guard let date = dateField.text else { return }
            
            //TODO: - save this cuisine below to 1) core data and 2) have it persist on the screen
            self.dateLabel.text = date
        }
        
        setDateAlert.addTextField { (textField) in
            textField.placeholder = "Enter Date"
            textField.textAlignment = .center
            textField.font = UIFont(name: "CJPotterHandwriting", size: 12.0)
        }
        setDateAlert.addAction(cancelAction)
        setDateAlert.addAction(doneAction)
        
        self.present(setDateAlert, animated: true, completion: nil)
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
    
    //MARK: - photo picker methods
    func selectProfileImage() {
        print(123)
        
        let picker = UIImagePickerController()
        picker.delegate = self
        print("I WANNA EDIT A DAMN PHOTO")
        picker.isEditing = true
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            
            print("This is an edited image \(editedImage)")
            selectedImageFromPicker = editedImage
        } else if let original = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            print("This is the original \(original)")
            selectedImageFromPicker = original
        }
        
        if let selectedImage = selectedImageFromPicker {
            let data = UIImagePNGRepresentation(selectedImage)
            guard let imageData = data else { return }
            print("okkkkkkkkk\(imageData)")
            
            foodImage.image = selectedImage
            userChoseImage = true
            print("imagePickerController() - userChoseImage: \(userChoseImage)")
            //       FirebaseManager.ref.child("users").child(FirebaseManager.currentUser).child("profilePic").setValue(["\()" : true])
            super.dismiss(animated: true, completion:nil)
        }
    }

}
