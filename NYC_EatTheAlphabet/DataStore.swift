//
//  DataStore.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 1/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import Foundation
import CoreData

//reminder: a dataStore is a singleton; here we fetch/save Core Data
class DataStore {
    
    static let sharedInstance = DataStore()
    
    var letters:[Letter] = []
    
    private init() {}
    
    // MARK: - Core Data stack
    
    //1 - persistent container & saveContext func are commonly kept in the DATASTORE
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "EatTheAlphabet")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() {
        
        //2 - get the content from our container (file cabinet)
        //how we get access to our managed context (our scratchpad, our area to save things and mess around with it)
        let managedContext = self.persistentContainer.viewContext
        
        
        //Implement fetchData() to create an NSFetchRequest, have your context fetch it, set the results to your messages array, and sort messages by their creation dates.
        //3 - create a fetchRequest
        let fetchRequest: NSFetchRequest<Letter> = Letter.fetchRequest()
        
        //4 - have our managedContext fetch w/ this fetchRequest w/ do try catch
        do {
            
            //5 - the managedContext.fetch returns an array; set our results to our messages array
            self.letters = try managedContext.fetch(fetchRequest)
            
        } catch {
            
            print("Catch - fetchData()")
        }
    }
    
    func deleteAllMessages() {
        
        //here we fetch before we delete
        let fetchRequest: NSFetchRequest<Letter> = Letter.fetchRequest()
        do {
            var fetchedLetters = try persistentContainer.viewContext.fetch(fetchRequest)
            for letter in fetchedLetters {
                persistentContainer.viewContext.delete(letter)
            }
            self.letters = []
            saveContext() //this is our "confirmation"
        } catch {
            print("catch - deleteAllLetters")
        }
    }
    
    
    
}
