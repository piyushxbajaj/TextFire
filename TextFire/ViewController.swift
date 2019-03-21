//
//  ViewController.swift
//  TextFire
//
//  Created by Piyush Bajaj on 3/21/19.
//  Copyright © 2019 Piyush Bajaj. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var myText: UITextField!
    var ref : DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveButton(_ sender: Any) {
        ref = Database.database().reference()
        if myText.text != ""
        {
            ref?.child("list").childByAutoId().setValue(myText.text)
            myText.text = ""
        }
        
    }
    
}

