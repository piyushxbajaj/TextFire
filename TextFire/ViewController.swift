//
//  ViewController.swift
//  TextFire
//
//  Created by Piyush Bajaj on 3/21/19.
//  Copyright © 2019 Piyush Bajaj. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //Creating outlets of the table view and text field.
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myText: UITextField!
    
    var ref : DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Creating Action Outlet for the save button.
    @IBAction func saveButton(_ sender: Any) {
        ref = Database.database().reference()
        
        if myText.text != ""
        {
            ref?.child("list").childByAutoId().setValue(myText.text)
            //Setting the element in Database
            myText.text = ""
        }
        
    }
    
    //Setting up the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

