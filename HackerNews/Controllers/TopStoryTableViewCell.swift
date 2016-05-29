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
    @IBOutlet weak var lblBy: UILabel!
    @IBOutlet weak var lblTimeString: UILabel!
    @IBOutlet weak var btnScore: UIButton!
    
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
        lblHeading.setProperties(ColorConstant.HEADER, textFont: FontConstant.REGULAR_15)
        lblTimeString.setProperties(ColorConstant.SUBTITLE_GRAY, textFont: FontConstant.REGULAR_13)
        btnScore.setProperties(ColorConstant.HEADER, textFont: FontConstant.REGULAR_13)
        btnScore.makeRoundCorner(3.0, borderColor: ColorConstant.SCORE_BORDER, borderWidth: 1.0)
        lblBy.setProperties(ColorConstant.URL, textFont: FontConstant.REGULAR_13)
        self.selectionStyle = .None
    }

}
