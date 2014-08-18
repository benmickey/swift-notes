//
//  NotesDetailViewController.swift
//  Swifty Notes
//
//  Created by Benjamin Mickey on 8/14/14.
//  Copyright (c) 2014 Ben Mickey. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    var note:Note? //variable note of type note and is opptional so doesn't need to have value.... 
    //nonoptional values need to have value when they are created -- note will get set later on so use
    //optional... -- at any point in time can be nil and then

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        titleTextField.text = note?.title
        
        contentTextView.text = note?.content
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let actualNote = note {
            actualNote.title = titleTextField.text
            actualNote.content = contentTextView.text
            
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
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
