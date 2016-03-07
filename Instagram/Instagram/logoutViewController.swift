//
//  logoutViewController.swift
//  Instagram
//
//  Created by Joe Plumitallo on 3/7/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit
import Parse

class logoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor(red: 0.15, green: 0.30, blue: 0.70, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 22)!]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogoutButton(sender: AnyObject) {
        
        let okAction = UIAlertAction(title: "Logout", style: UIAlertActionStyle.Default){
            action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        
            
            // Logs the user out and segues to Login View
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedin");
            NSUserDefaults.standardUserDefaults().synchronize();
            
            PFUser.logOutInBackgroundWithBlock{ (error: NSError?) -> Void in
                
               /* let logoutViewController = self.storyboard!.instantiateViewControllerWithIdentifier("logoutViewController") as! logoutPageViewController;
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.rootViewController = logoutViewController;
                
                appDelegate.window?.makeKeyAndVisible();*/
                
                
            }
            
            
        }
        
        // Cancels the Logout
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default){
            action in
            self.dismissViewControllerAnimated(true, completion: nil);
            
            
        }
        
        // Ask user if they really want to logout
        self.displaySignOutMessage("Are you sure that you want to Logout?")
        return
        
        
        
    }
    // Sets the variable for displaySignOutMessage
    func displaySignOutMessage(userMessage:String)
    {
        var TextFieldAlert = UIAlertController(title: "Logout", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler:nil);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:nil)
        
        TextFieldAlert.addAction(cancelAction);
        TextFieldAlert.addAction(okAction);
        self.presentViewController(TextFieldAlert, animated:true, completion: nil);
        self.performSegueWithIdentifier("logoutSegue", sender: self)

    }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

