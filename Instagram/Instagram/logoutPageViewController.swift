//
//  logoutPageViewController.swift
//  Instagram
//
//  Created by Joe Plumitallo on 3/7/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit

class logoutPageViewController: UIViewController {

    @IBOutlet weak var logoutImageInsta: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

             logoutImageInsta.image = UIImage(named: "iconmonstr-instagram-6-240")
        // Do any additional setup after loading the view.
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
