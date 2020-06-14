//
//  FrontPageViewController.swift
//  MatchApp
//
//  Created by Meruyert Tastandiyeva on 5/11/20.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit

class FrontPageViewController:  UIViewController, UITextFieldDelegate{

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    static var usernameText: String = "Undefined"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func PressToStart(_ sender: Any) {
        if username.text != "" {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(controller, animated: true)
            
            FrontPageViewController.usernameText = username.text!
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Fill out your name", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
}
