//
//  HomeVC.swift
//  LoginPage
//
//  Created by Tea Kupradze on 3/15/18.
//  Copyright © 2018 Sergey Nikolaev. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var btnAddClient: UIButton!
    @IBOutlet weak var btnSearchClient: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddClient.layer.cornerRadius = 30
        btnAddClient.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        btnAddClient.layer.shadowOffset = CGSize(width: 0, height: 3)
        btnAddClient.layer.shadowOpacity = 1.0
        btnAddClient.layer.shadowRadius = 10.0
        btnAddClient.layer.masksToBounds = false
        
        btnSearchClient.layer.cornerRadius = 30
        btnSearchClient.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        btnSearchClient.layer.shadowOffset = CGSize(width: 0, height: 3)
        btnSearchClient.layer.shadowOpacity = 1.0
        btnSearchClient.layer.shadowRadius = 10.0
        btnSearchClient.layer.masksToBounds = false
    }
     func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    @IBAction func addUserPapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "xxxRegisterUser")
        self.present(vc!, animated: true, completion: nil)
        //self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "xxxSearchVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    
}
