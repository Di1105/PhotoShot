//
//  SettingsVC.swift
//  PhotoShot
//
//  Created by Dilara Elçioğlu on 31.10.2022.
//

import UIKit
import FirebaseAuth

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        }catch{
            
        }
    }
}
