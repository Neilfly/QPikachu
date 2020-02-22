//
//  SecondMainViewController.swift
//  QPikachu
//
//  Created by 张雨飞 on 7/02/20.
//  Copyright © 2020 张雨飞. All rights reserved.
//

import UIKit

class SecondMainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundImage.alpha = 0.5
        self.view.layoutIfNeeded()
        let headImageLayer: CALayer = headImage.layer
        headImageLayer.masksToBounds = true
        headImageLayer.cornerRadius = headImage.frame.width / 2
        headImageLayer.borderWidth = 5
        headImageLayer.borderColor = #colorLiteral(red: 0.4882740378, green: 0.6144382954, blue: 0.8381537795, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeHeadImageButton(_ sender: Any) {
        let alert = UIAlertController(title: "想以什么方式更改头像？", message: nil, preferredStyle: .alert)
        let Album = UIAlertAction(title: "从相册中选取照片", style: .default) { (_) in
            self.openAlbum()
        }
        let Camera = UIAlertAction(title: "拍摄照片", style: .default) { (_) in
            self.openCamera()
        }
        alert.addAction(Camera)
        alert.addAction(Album)
        present(alert, animated: true, completion: nil)
    }
    
    func openAlbum() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
        
        else {
            print("读取相册错误")
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
        else {
            debugPrint("找不到相机")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        headImage.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
}

