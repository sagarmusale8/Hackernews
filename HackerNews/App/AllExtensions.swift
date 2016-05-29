//
//  AllExtensions.swift
//  HackerNews
//
//  Created by Sagar Musale on 15/05/16.
//  Copyright © 2016 Sagar Musale. All rights reserved.
//

import UIKit

extension UILabel{
    
    // Setting Label textColor and textFont
    func setProperties(textColor: UIColor? = nil, textFont: UIFont? = nil) {
        
        if let lblColor = textColor{
            self.textColor = lblColor
        }
        
        if let lblFont = textFont{
            self.font = lblFont
        }
    }
}

extension UIButton{
    
    // Setting textColor, textFont and backgroundColor
    func setProperties(textColor: UIColor? = nil, textFont: UIFont? = nil, backgroundColor: UIColor? = UIColor.clearColor()) {
        
        self.backgroundColor = backgroundColor!
        
        if let lblColor = textColor{
            self.setTitleColor(lblColor, forState: .Normal)
        }
        
        if let lblFont = textFont{
            self.titleLabel?.font = lblFont
        }
    }
}

extension UIColor{
    
    // Color with RGBA
    class func RGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)->UIColor{
        return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
}

extension NSDate{
    
    // Getting Readable String from unixTime
    class func stringFromUnixTime(unixTime: NSNumber)->String{
        let date = NSDate(timeIntervalSince1970: unixTime.doubleValue)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM, yy HH:mm"
        return dateFormatter.stringFromDate(date)
    }
}

extension UIView{
    
    // Making view rounded corner
    func makeRoundCorner(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.CGColor
    }
}