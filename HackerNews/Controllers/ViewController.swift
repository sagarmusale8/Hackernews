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
    let reusbaleIdForTopStoryCell = String(TopStoryTableViewCell)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: TableView DataSource and Delegate Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSectionForTopStories
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        return defaultNumberOfRows
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

