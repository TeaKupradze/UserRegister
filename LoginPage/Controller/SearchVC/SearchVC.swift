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

   // @IBOutlet weak var userConsolList: UITextView!
    @IBOutlet weak var chackUserBtn: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var object: Array<UserObject> = []
    var filteredObjectList: Array<UserObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        hideKeyboard()
    }

    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
             view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        object = loadFromBase() as! Array<UserObject>
        tableView.reloadData()
    
    }

    func loadFromBase() -> Array<Any> {
        var returnedArray = Array<Any>()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    let userObj = UserObject()
                    if let fetched = result.value(forKey: "email") as? String {
                        userObj.email = fetched
        
                    }
                    if let fetched = result.value(forKey: "firstName") as? String {
                        userObj.firstname = fetched
                        
                    }
                    if let fetched = result.value(forKey: "lastName") as? String {
                        userObj.lastname = fetched
                        
                    }
                    if let fetched = result.value(forKey: "phoneNumber") as? String {
                        userObj.phoneNumber = fetched
                        
                    }
                    if userObj.email != nil && userObj.firstname != nil && userObj.lastname != nil && userObj.phoneNumber != nil {
                    returnedArray.append(userObj)
                    }
                }
            } else {
               // userConsolList.text? = "No result"
            }
        } catch  {
           // userConsolList.text? = "Error fetching from base"
        }
        return returnedArray
    }

}
extension SearchVC : UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.object.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let userCell = tableView.dequeueReusableCell(withIdentifier: "xxxUserObjectCell", for: indexPath) as! UserObjectCell
        
        let userItem: UserObject!
        userItem = object[indexPath.row]
    
        userCell.email.text = userItem.email
        userCell.name.text = userItem.firstname
        userCell.lastname.text = userItem.lastname
        userCell.phoneNumber.text = userItem.phoneNumber
        return userCell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
}

