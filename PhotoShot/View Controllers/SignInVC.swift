//
//  ViewController.swift
//  PhotoShot
//
//  Created by Dilara Elçioğlu on 28.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInVC: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signInButton(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!){result,error in
                if error != nil{
                    print(result as Any)
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "username/email/password?")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if userNameText.text != "" && emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!){auth,error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    let firestore = Firestore.firestore()
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.userNameText.text!] as! [String:Any]
                    firestore.collection("UserInfo").addDocument(data: userDictionary){ error in
                        if error != nil{
                            self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                        }else{
                            print(userDictionary)
                        }
                    }
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
            self.makeAlert(title: "Error", message: "username/email/password?")
        }
    }
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

