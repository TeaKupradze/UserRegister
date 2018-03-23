//
//  RegusterUserVC.swift
//  LoginPage
//
//  Created by Tea Kupradze on 3/14/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit
import CoreData

let appDelegateUser = AppDelegate()
let contextUser = appDelegate.persistentContainer.viewContext

class RegusterUserVC: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var succsesAlert: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 20
        saveBtn.layer.masksToBounds = true

    }
    @IBAction func backToHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SaveUser(_ sender: Any) {
        saveToBase()
        firstName.text = ""
        lastName.text = ""
        email.text = ""
        phoneNumber.text = ""
        //dismiss(animated: true, completion: nil)
    
    }
    func saveToBase() {
        let contaner = NSEntityDescription.insertNewObject(forEntityName: "Users", into: contextUser)
        if firstName.text == "" {
            succsesAlert.text? = "FirstName field is empty"
        } else {
            if lastName.text == "" {
               succsesAlert.text? = "LastName field is empty"
            } else  {
                if email.text == ""{
                 email.text? = "Email field is empty"
                }else {
                    if phoneNumber.text == " "{
                        phoneNumber.text? = "Phone Number field is empty"
                    }
                }
                do {
                    contaner.setValue(firstName.text, forKey: "firstName")
                    contaner.setValue(lastName.text, forKey: "lastName")
                    contaner.setValue(email.text, forKey: "email")
                    contaner.setValue(phoneNumber.text, forKey: "phoneNumber")
                    try context.save()
                    succsesAlert.text? = "User saved"
                    
                } catch  {
                    succsesAlert.text? = "Error"
                }
            }
        }
    }
}
