//
//  LogInScreen.swift
//  LoginPage
//
//  Created by Tea Kupradze on 4/13/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class LogInScreen: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    //MARK: IBAction
    @IBAction func LogInClickd(_ sender: Any) {
        
    }
    
    @IBAction func RegisterButtonClickd(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationScreen") as! RegistrationScreen
        navigationController?.pushViewController(vc, animated: true)
        
    
    }
}
