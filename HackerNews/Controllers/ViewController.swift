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
    static var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        getTopStoriesData()
    }
    
    // MARK: Getting top stories items
    func getTopStoriesData() {
        let newsItems = NewsDataHandler.getAllNews()
        if newsItems?.count > 0{
            self.topStoriesNews.addObjectsFromArray(newsItems!)
            self.tableViewTopStories.reloadData()
        }
        NetworkManager().makeRequestWithRequestType(ProjectConstant.URL_TOP_STORIES, requestType: "GET", withParameters: NSMutableDictionary()) { (success, response, error) in
            if let responseArr = response as? NSMutableArray where success{
                self.allTopStoriesIds = responseArr
                self.fetchNewsDataForPage()
            }
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
                    NetworkManager().makeRequestWithRequestType(urlStr, requestType: "GET", withParameters: NSMutableDictionary(), withCompletion: { (success, response, error) in
                        if let responseVal = response as? NSDictionary where success{
                            if let newsItem = NewsDataHandler.saveNewsObject(responseVal){
                                self.topStoriesNews.addObject(newsItem)
                            }
                        }
                        ViewController.count -= 1
                        if ViewController.count == 0{
                            self.tableViewTopStories.reloadData()
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
                    cell.lblScore.text = String(score)
                }
                if let time = news.time{
                    cell.lblTimeString.text = NSDate.stringFromUnixTime(time)
                }
                if let urlStr = news.url{
                    cell.lblUrl.text = urlStr
                }
            }
            
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

