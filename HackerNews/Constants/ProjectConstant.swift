//
//  ProjectConstant.swift
//  HackerNews
//
//  Created by Sagar Musale on 16/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

class ProjectConstant: NSObject {
    
    // MARK: Request Type
    static let REQUEST_GET = "GET"

    // MARK: Strings
    static let STR_ITEM_ID = "ITEM_ID"
    
    // MARK: All URLs
    static let URL_BASE_SERVER = "https://hacker-news.firebaseio.com/v0/"
    static let URL_TOP_STORIES = "topstories.json"
    static let URL_NEWS_DETAILS = "item/ITEM_ID.json"
    
    // Segue ID
    static let SEGUE_NEWS_DETAILS = "show_details"
}
