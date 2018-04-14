//
//  RegistrationScreen.swift
//  LoginPage
//
//  Created by Tea Kupradze on 4/14/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class RegistrationScreen: UIViewController {
    
    //MARK:IBOutlet
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    //MARK:IBAction
    @IBAction func backButtonClickd(_ sender: UIButton) {
        
      navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registrationButtonClickd(_ sender: Any) {
    }
    

}
