//
//  News+CoreDataProperties.swift
//  HackerNews
//
//  Created by Sagar Musale on 29/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension News {

    @NSManaged var by: String?
    @NSManaged var dead: NSNumber?
    @NSManaged var descendants: NSNumber?
    @NSManaged var id: NSNumber?
    @NSManaged var kids: NSObject?
    @NSManaged var parent: NSNumber?
    @NSManaged var parts: NSObject?
    @NSManaged var score: NSDecimalNumber?
    @NSManaged var text: String?
    @NSManaged var time: NSNumber?
    @NSManaged var title: String?
    @NSManaged var type: String?
    @NSManaged var url: String?

}
