//
//  FriendListViewController.swift
//  Friendbook
//
//  Created by Can on 9/8/15.
//  Copyright (c) 2015 Can. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let myFriends = ["Hannah", "Jocelyn", "Johnathon", "Liam", "Molly"]
    
    var selectedFriend = "Joe"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myFriends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
//        cell.backgroundColor = UIColor.yellowColor()
        
        cell.textLabel!.text = myFriends[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedFriend = myFriends[indexPath.row]
        
        self.performSegueWithIdentifier("friendListToFriendDetailSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController = segue.destinationViewController as! FriendDetailViewController
        detailViewController.name = self.selectedFriend
        
        if self.selectedFriend == "Hannah" {
            detailViewController.birthday = "July 19th"
        } else if self.selectedFriend == "Jocelyn" {
            detailViewController.birthday = "July 20th"
        } else if self.selectedFriend == "Johnathon" {
            detailViewController.birthday = "July 21th"
        } else if self.selectedFriend == "Liam" {
            detailViewController.birthday = "July 22th"
        } else if self.selectedFriend == "Molly" {
            detailViewController.birthday = "July 23th"
        }
    }


//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
