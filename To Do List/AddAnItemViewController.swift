//
//  AddAnItemViewController.swift
//  To Do List
//
//  Created by Sasha Dubikovskaya on 10.01.2019.
//  Copyright © 2019 To Do List. All rights reserved.
//

import UIKit

internal var myItem = [String]()

class AddAnItemViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var labelMessege: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
            
        if textField.text != "" {
            
            let itemsObject = UserDefaults.standard.object(forKey: "items")
            
            if let tempItems = itemsObject as? [String] {
                
                myItem = tempItems
        
                myItem.append(textField.text!)
            
                labelMessege.text = "Your item was added."
                
                }
            
            UserDefaults.standard.set(myItem, forKey: "items")
            
            textField.text = ""
            
        } else {
            
           labelMessege.text = "You should add an item!"
            
        }
    }
    
    // MARK - control keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
