//
//  NewsDetailsViewController.swift
//  HackerNews
//
//  Created by Sagar Musale on 18/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var barBtnItem : UIBarButtonItem?
    var newsItem: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
        loadNewsUrl()
    }
    
    // Showing navigation bar title
    func setupNavigationController(){
        var titleStr = "Details"
        if let title = newsItem?.title{
            titleStr = title
        }
        self.title = titleStr
    }
    
    // Loading url for newsItem
    func loadNewsUrl(){
        if let url = newsItem?.url{
            let request = NSURLRequest(URL: NSURL(string: url)!)
            webView.loadRequest(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
