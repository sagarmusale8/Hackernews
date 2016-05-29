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
    var allTopStoriesIds = NSMutableArray()
    var topStoriesNews = NSMutableArray()
    let reusbaleIdForTopStoryCell = String(TopStoryTableViewCell)
    let pageCount = 25
    static var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        getTopStoriesData()
    }
    
    @IBAction func actionOnRefresh(sender: AnyObject) {
        self.getTopStoriesData()
    }
    
    // MARK: Getting top stories items
    func getTopStoriesData() {
        loadDataFromCoreData()
        allTopStoriesIds.removeAllObjects()
        NetworkManager().makeRequestWithRequestType(ProjectConstant.URL_TOP_STORIES, requestType: ProjectConstant.REQUEST_GET, withParameters: NSMutableDictionary()) { (success, response, error) in
            if let responseArr = response as? NSMutableArray where success{
                self.allTopStoriesIds.addObjectsFromArray(responseArr as [AnyObject])
                self.fetchNewsDataForPage()
            }
        }
    }
    
    // MARK: Loading data from CoreData
    func loadDataFromCoreData(){
        self.topStoriesNews.removeAllObjects()
        let newsItems = NewsDataHandler.getAllNews()
        if newsItems?.count > 0{
            self.topStoriesNews.addObjectsFromArray(newsItems!)
            self.tableViewTopStories.reloadData()
        }
    }
    
    // MARK: Fetching news for page items
    func fetchNewsDataForPage() {
        let allIds = getAllIdsForStories()
        for index in 0...allTopStoriesIds.count-1{
            if let itemId = allTopStoriesIds.objectAtIndex(index) as? Int {
                // Fetching data if only it is not saved
                if !allIds.containsObject(itemId){
                    let urlStr = ProjectConstant.URL_NEWS_DETAILS.stringByReplacingOccurrencesOfString(ProjectConstant.STR_ITEM_ID, withString: String(itemId))
                    ViewController.count += 1
                    NetworkManager().makeRequestWithRequestType(urlStr, requestType: ProjectConstant.REQUEST_GET, withParameters: NSMutableDictionary(), withCompletion: { (success, response, error) in
                        if let responseVal = response as? NSDictionary where success{
                            if let newsItem = NewsDataHandler.saveNewsObject(responseVal){
                                self.topStoriesNews.addObject(newsItem)
                            }
                        }
                        ViewController.count -= 1
                        // Loading data if 25 or all items fetchedytrert
                        if (ViewController.count == 0) || (self.topStoriesNews.count % 25 == 0){
                            self.loadDataFromCoreData()
                        }
                    })
                }
            }
        }
    }
    
    // Getting all ids
    func getAllIdsForStories()->NSArray{
        let allIds = NSMutableArray()
        for newsItem in topStoriesNews{
            if let thisNews = newsItem as? News{
                allIds.addObject(thisNews.id!)
            }
        }
        
        return allIds
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
            if let news = topStoriesNews.objectAtIndex(indexPath.row) as? News{
                if let title = news.title{
                    cell.lblHeading.text = title
                }
                if let score = news.score{
                    cell.btnScore.setTitle(String(score), forState: .Normal)
                }
                if let time = news.time{
                    cell.lblTimeString.text = NSDate.stringFromUnixTime(time)
                }
                if let writer = news.by{
                    cell.lblBy.text = "by " + writer
                }
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ProjectConstant.SEGUE_NEWS_DETAILS, let destination = segue.destinationViewController as? NewsDetailsViewController {
            if let cell = sender as? UITableViewCell, let indexPath = tableViewTopStories.indexPathForCell(cell) {
                if let newsItem = topStoriesNews[indexPath.row] as? News{
                    destination.newsItem = newsItem
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

