//
//  ViewController.swift
//  LoginPage
//
//  Created by Sergey Nikolaev on 2/5/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is furnished
//to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.



import UIKit
import CoreData

//let appDelegate = AppDelegate()
//let context = appDelegate.persistentContainer.viewContext

class ViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var loadButton: UIButton!
    @IBOutlet var miniConsole: UITextView!
    
    @IBAction func checkContext(_ sender: Any) {
        let userNames = loadFromBase(Atribute: "name")
        let userPassword = loadFromBase(Atribute: "pass")
        if userNames.count>0 {
            miniConsole.text? = "\(userNames) - \(userPassword)"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "xxxRegisterUser")
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
           miniConsole.text? = "Users not found"
        }
    }

    @IBAction func saveContext(_ sender: Any) {
        saveToBase()
        nameField.text = " "
        passwordField.text = " "
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.numberOfLines = 3
        welcomeLabel.text? = "Welcome to App \n Enter Name and Pass"
        
        nameField.placeholder = "User"
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true

        checkButton.setTitle("Check", for: .normal)
        loadButton.setTitle("Load to base", for: .normal)
        
        miniConsole.text? = "Mini console loaded..."

    }
    
    func saveToBase() {
        
        let contaner = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        
        if nameField.text == "" {
            
            miniConsole.text? = "Name field is empty"
            
        } else {
            
            if passwordField.text == "" {
               
                miniConsole.text? = "Password field is empty"
                
            } else {
                
                do {
                    contaner.setValue(nameField.text, forKey: "name")
                    contaner.setValue(passwordField.text, forKey: "pass")
                    
                    try context.save()
                    miniConsole.text? = "User saved"
                    
                } catch  {
                    miniConsole.text? = "Error"
                }
            }
        }
    }
    

    func loadFromBase(Atribute:String) -> Array<Any> {
     
        var returnedArray = Array<Any>()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                
                    if let fetched = result.value(forKey: Atribute) as? String {
                        
                        returnedArray.append(fetched)
                    }
                }
            } else {
                
                miniConsole.text? = "No result"
            }
            
        } catch  {
            
            miniConsole.text? = "Error fetching from base"
            
        }
        return returnedArray
    }
    
}

