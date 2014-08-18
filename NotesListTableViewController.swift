//
//  NotesListTableViewController.swift
//  Swifty Notes
//
//  Created by Benjamin Mickey on 8/13/14.
//  Copyright (c) 2014 Ben Mickey. All rights reserved.
//

import UIKit

class NotesListTableViewController: UITableViewController {
    
    var notes = Array<Note>() //store types in arrays now and generics... 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return notes.count;
        
        //tell table view to always reload data
    }
    
    //tell table view to always reload data
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    //implement deletions...
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete)
        {
            //Delete the the element -- notes object
            notes.removeAtIndex(indexPath.row)
            
            //Update the user interface for new state
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
    }

    
    //Creates table view cells when asked by table view... 
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        //let marks a constant in swift -- you don't want to change after iniital assignment -- use let... 
        //use let or var and swift can infer type when you immediately define / assign value...
        //dot notation for functions and properties 
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as UITableViewCell  //as is for downcasting for type not anytype but UITableViewCell... 

        // Configure the cell...
        cell.textLabel.text = notes[indexPath.row].title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        //Called whenever segue is selected... 
        
        if(segue.identifier == "addNote")
        {
            var newNote = Note();
            newNote.title = "Your Title"
            newNote.content = "Your Note"
            
            notes.append(newNote)
            
            let detailViewController = segue.destinationViewController as NotesDetailViewController
            detailViewController.note = newNote
        }
        
        else if(segue.identifier == "showNote")
        {
            let detailViewController = segue.destinationViewController as NotesDetailViewController
            detailViewController.note = notes[tableView.indexPathForSelectedRow().row]
        }
    }


}
