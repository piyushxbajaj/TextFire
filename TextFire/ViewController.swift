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

    
    var handle : DatabaseHandle!
    var ref : DatabaseReference!
    var myList:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        handle = ref?.child("list").observe(.childAdded, with:{ (DataSnapshot) in
            if let item  = DataSnapshot.value as? String
            {
                self.myList.append(item)
                self.myTableView.reloadData()
            }
        }
            // Do any additional setup after loading the view, typically from a nib.
        )}
    
    //Creating Action Outlet for the save button.
    @IBAction func saveButton(_ sender: Any) {
        let alert = UIAlertController(title: "add?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { UITextField in
            UITextField.placeholder = "Enter the name you want to enter"
        })
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { addAction in
            
            if let name = alert.textFields?.first?.text{
                if name != ""
                {
                    self.ref?.child("list").childByAutoId().setValue(name)
                    //Setting the element in Database
                }
                
            }
            }))
        self.present(alert,animated: true,completion: nil)
        
    }
    
    //Setting up the table view.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
    }
    
    
}

