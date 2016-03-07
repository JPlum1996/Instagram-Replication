//
//  PostsCell.swift
//  Instagram
//
//  Created by Joe Plumitallo on 3/7/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit
import Parse

class PostsCell: UITableViewCell {
    
    @IBOutlet weak var userName2: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postedImage: UIImageView!
    @IBOutlet weak var postedCaption: UILabel!
    
    var getPC: PFObject! {
        didSet {
            self.postedCaption.text = getPC["caption"] as? String
            self.userName.text = getPC["author"] as? String
            //self.userName2.text = getPC["author"] as? String
            
            if let userPicture = getPC["media"] as? PFFile {
                userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                    if (error == nil) {
                        self.postedImage.image = UIImage(data:imageData!)
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}