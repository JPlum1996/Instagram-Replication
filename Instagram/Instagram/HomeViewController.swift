//
//  HomeViewController.swift
//  Instagram
//
//  Created by Joe Plumitallo on 3/7/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var instaPosts: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor(red: 0.15, green: 0.30, blue: 0.70, alpha: 1)
        
        self.getPosts()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
        
        
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 22)!]
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPosts()
    {
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        query.findObjectsInBackgroundWithBlock { (results: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.instaPosts = results
                self.tableView.reloadData()
                
            } else {
                print(error)
            }
        }
        
    }
    
    func loadList(notification: NSNotification){
        self.getPosts()
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if instaPosts != nil {
            return instaPosts!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostsCell", forIndexPath: indexPath) as! PostsCell
        
        cell.getPC = instaPosts[indexPath.row]
        
        return cell
    }
    
}
