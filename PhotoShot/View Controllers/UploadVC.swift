//
//  UpdateVC.swift
//  PhotoShot
//
//  Created by Dilara Elçioğlu on 30.10.2022.
//

import UIKit

class UploadVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePic))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func choosePic(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }

    @IBAction func uploadButton(_ sender: Any) {
    }
}
