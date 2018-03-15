//
//  HomeVC.swift
//  LoginPage
//
//  Created by Tea Kupradze on 3/15/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func addUserPapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "xxxRegisterUser")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "xxxSearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
