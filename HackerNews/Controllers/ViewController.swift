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
    
    // MARK: Getting top stories items
    func getTopStoriesData() {
        NetworkManager().makeRequestWithRequestType(ProjectConstant.URL_TOP_STORIES, requestType: "GET", withParameters: NSMutableDictionary()) { (success, response, error) in
            if let responseArr = response as? NSMutableArray where success{
                self.allTopStoriesIds = responseArr
                self.fetchNewsDataForPage()
            }
        }
    }
    
    // MARK: Fetching news for page items
    func fetchNewsDataForPage() {
        let finalCount = pageNumber * pageCount
        let startCount = finalCount - pageCount
        
        for index in startCount...finalCount-1{
            if let itemId = allTopStoriesIds.objectAtIndex(index) as? Int{
                let urlStr = ProjectConstant.URL_NEWS_DETAILS.stringByReplacingOccurrencesOfString(ProjectConstant.STR_ITEM_ID, withString: String(itemId))
                NetworkManager().makeRequestWithRequestType(urlStr, requestType: "GET", withParameters: NSMutableDictionary(), withCompletion: { (success, response, error) in
                    if let responseVal = response as? NSDictionary where success{
                        let newsItem = News()
                        newsItem.setValuesForKeysWithDictionary(responseVal as! [String : AnyObject])
                        self.topStoriesNews.addObject(newsItem)
                    }
                    self.tableViewTopStories.reloadData()
                 })
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
            if let news = topStoriesNews.objectAtIndex(indexPath.row) as? News{
                if let title = news.title as? String{
                    cell.lblHeading.text = title
                }
                if let score = news.score{
                    cell.lblScore.text = String(score)
                }
                if let time = news.time{
                    cell.lblTimeString.text = NSDate.stringFromUnixTime(time)
                }
                if let urlStr = news.url as? String{
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

