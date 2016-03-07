//
//  LoginViewController.swift
//  Instagram
//
//  Created by Joe Plumitallo on 3/6/16.
//  Copyright © 2016 Joe Plumitallo. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var signUpBackground: UIImageView!
    @IBOutlet weak var signInBackground: UIImageView!
    @IBOutlet weak var instagramPic: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let color = UIColor(red: 0.15, green: 0.30, blue: 0.70, alpha: 1)
        
        self.signInBackground.layer.cornerRadius = 5
        self.signInBackground.clipsToBounds = true
        self.signUpBackground.layer.cornerRadius = 5
        self.signUpBackground.clipsToBounds = true
        
        instagramPic.image = UIImage(named: "iconmonstr-instagram-6-240")
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Chalkduster", size: 22)!]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("you've logged in")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }

    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                print("User Created")
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }else{
                print(error?.localizedDescription)
                if error?.code == 202 {
                    print("Username is taken")
                }
            }
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
    

}
