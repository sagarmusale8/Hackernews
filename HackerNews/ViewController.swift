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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: TableView DataSource and Delegate Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSectionForTopStories
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultNumberOfRows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

