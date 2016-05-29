//
//  NewsDataHandler.swift
//  HackerNews
//
//  Created by Sagar Musale on 23/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit
import CoreData

class NewsDataHandler: NSObject {

    // Saving News Objects
    class func saveNewsObject(newsDict: NSDictionary)->NSManagedObject?{
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedContext = appDelegate?.managedObjectContext
        
        let entityDescp = NSEntityDescription.entityForName("News",
                                                            inManagedObjectContext:managedContext!)
        let newsObj = NSManagedObject(entity: entityDescp!, insertIntoManagedObjectContext: managedContext!)
        
        newsObj.setValue(newsDict.objectForKey("id"), forKey: "id")
        newsObj.setValue(newsDict.objectForKey("title"), forKey: "title")
        newsObj.setValue(newsDict.objectForKey("by"), forKey: "by")
        newsObj.setValue(newsDict.objectForKey("time"), forKey: "time")
        newsObj.setValue(newsDict.objectForKey("type"), forKey: "type")
        newsObj.setValue(newsDict.objectForKey("text"), forKey: "text")
        newsObj.setValue(newsDict.objectForKey("url"), forKey: "url")
        newsObj.setValue(newsDict.objectForKey("score"), forKey: "score")
        newsObj.setValue(newsDict.objectForKey("parent"), forKey: "parent")
        newsObj.setValue(newsDict.objectForKey("dead"), forKey: "dead")
        
        do{
            try managedContext?.save()
            return newsObj
        } catch let error as NSError {
            print("ERROR in save \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    // Getting array of news
    class func getAllNews()->[NSManagedObject]? {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let managedContext = appDelegate?.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "News")
        
        do {
            let sortDescriptor = NSSortDescriptor(key: "score", ascending: false)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = sortDescriptors
            let results =
                try managedContext!.executeFetchRequest(fetchRequest)
            
            return results as? [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return nil
    }

}
