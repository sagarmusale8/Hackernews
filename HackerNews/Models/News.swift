//
//  News.swift
//  HackerNews
//
//  Created by Sagar Musale on 17/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var id: NSNumber?           // The item's unique id.
    var deleted: Bool?          // true if the item is deleted.
    var type: NSString?         // The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    var by: NSString?           // The username of the item's author.
    var time: NSNumber?         // Creation date of the item, in Unix Time.
    var text: NSString?         // The comment, story or poll text. HTML.
    var dead: Bool?             // true if the item is dead.
    var parent: NSNumber?       // The item's parent. For comments, either another comment or the relevant story. For pollopts, the relevant poll.
    var kids: NSArray?          // 	The ids of the item's comments, in ranked display order.
    var url: NSString?          // The URL of the story.
    var score: NSNumber?        // The story's score, or the votes for a pollopt.
    var title: NSString?        // The title of the story, poll or job.
    var parts: NSArray?         // A list of related pollopts, in display order.
    var descendants: NSNumber?  // In the case of stories or polls, the total comment count.

}
