//
//  ViewController.swift
//  HotelFinder
//
//  Created by Roberto Merino on 18/8/16.
//  Copyright © 2016 Roberto Merino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
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
    
    // Nota: acciones
    
    @IBAction func login(sender: UIButton) {
        print("Hola Mundo")
    }

}

