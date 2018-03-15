//
//  SearchVC.swift
//  LoginPage
//
//  Created by Tea Kupradze on 3/15/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit
import CoreData

class SearchVC: UIViewController {

    @IBOutlet weak var userConsolList: UITextView!
    @IBOutlet weak var chackUserBtn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        let userNames = loadFromBase(Atribute: "firstName")
        let userPassword = loadFromBase(Atribute: "lastName")
        let email = loadFromBase(Atribute: "email")
        let phoneNumber = loadFromBase(Atribute: "phoneNumber")
        if userNames.count>0 {
            userConsolList.text? = "\(userNames) - \(userPassword) - \(email) - \(phoneNumber)"
        } else {
            userConsolList.text? = "Users not found"
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
                userConsolList.text? = "No result"
            }
        } catch  {
            userConsolList.text? = "Error fetching from base"
        }
        return returnedArray
    }

}
