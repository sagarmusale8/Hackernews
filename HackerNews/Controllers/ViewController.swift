//
//  ViewController.swift
//  HackerNews
//
//  Created by Sagar Musale on 14/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewTopStories: UITableView!
    
    let numberOfSectionForTopStories = 1
    let defaultNumberOfRows = 0
    var allTopStoriesIds: NSMutableArray!
    var topStoriesNews = NSMutableArray()
    let reusbaleIdForTopStoryCell = String(TopStoryTableViewCell)
    // Paging vars
    let pageCount = 25
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        getTopStoriesData()
    }
    
    // Getting top stories items
    func getTopStoriesData() {
        NetworkManager().makeRequestWithRequestType("topstories.json", requestType: "GET", withParameters: NSMutableDictionary()) { (success, response, error) in
            if let responseArr = response as? NSMutableArray where success{
                self.allTopStoriesIds = responseArr
            }
        }
    }
    
    // MARK: TableView DataSource and Delegate Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSectionForTopStories
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoriesNews.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(reusbaleIdForTopStoryCell) as? TopStoryTableViewCell{

            cell.setupUIProperties()
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

