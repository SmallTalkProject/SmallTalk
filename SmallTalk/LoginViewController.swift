//
//  LoginViewController.swift
//  SmallTalk
//
//  Created by Thomas Le on 10/25/18.
//  Copyright © 2018 Vibhu Appalaraju. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBAction func onGuestTap(_ sender: Any) {
        let newUser = PFUser()
        
        var usernameList = ["apple", "pear", "guava", "mango", "orange", "peach", "pineapple", "blueberry", "strawberry", "banana", "kiwi", "avocado", "grape", "watermelon", "cherry", "lemon"]
        
        //set user properties
        
        // Generate a random index
        let randomIndex = Int(arc4random_uniform(UInt32(usernameList.count)))
        // Get a random item
        let randomItem = usernameList[randomIndex]
        
        newUser.username = randomItem
        print(randomItem)
        
        if let index = usernameList.index(of: newUser.username!) {
            usernameList.remove(at: index)
        }
        
        //newUser.email = emailField.text
        newUser.password = "smalltalk"
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
        
        let username = newUser.username
        let password = newUser.password
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            if let error = error {let alertController = UIAlertController(title: "Problem with logging in", message: "Login was unsuccessful", preferredStyle: .alert)
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alertController
                alertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                print("User log in failed: \(error.localizedDescription)")
            } else {
                self.performSegue(withIdentifier: "guestSegue", sender: nil)
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
