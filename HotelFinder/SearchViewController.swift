//
//  SearchViewController.swift
//  HotelFinder
//
//  Created by Roberto Merino on 20/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing (textField: UITextField) {
        // change the content
        // mealNameLabel.text = textField.text
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func search(sender: UIButton) {
        //print(searchTextField.text!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowTableView" {
            print("TABLEVIEW")
            let hotelTableViewController = segue.destinationViewController as! HotelTableViewController
            let searchString = searchTextField.text
            hotelTableViewController.city = searchString!
            
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
    @IBAction func logout(sender: UIBarButtonItem) {
        let Login = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController")
        self.presentViewController(Login, animated: true, completion: nil)
    }
    
}
