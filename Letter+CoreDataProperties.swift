//
//  Letter+CoreDataProperties.swift
//  NYC_EatTheAlphabet
//
//  Created by Erica Millado on 1/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Letter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Letter> {
        return NSFetchRequest<Letter>(entityName: "Letter");
    }

    @NSManaged public var cuisine: String?
    @NSManaged public var restaurant: String?
    @NSManaged public var whoIAteWith: String?
    @NSManaged public var whatIAte: String?

}
