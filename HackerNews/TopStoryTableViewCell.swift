//
//  TopStoryTableViewCell.swift
//  HackerNews
//
//  Created by Sagar Musale on 15/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

class TopStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnUrl: UIButton!
    @IBOutlet weak var lblTimeString: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Setting up UI Components
    func setupUIProperties(){
        
    }

}
