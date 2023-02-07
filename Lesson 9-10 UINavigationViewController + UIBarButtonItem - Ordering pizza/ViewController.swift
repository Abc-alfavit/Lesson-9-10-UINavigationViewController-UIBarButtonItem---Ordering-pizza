//
//  ViewController.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizza
//
//  Created by Валентин Ремизов on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var eyeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let touchEye = UITapGestureRecognizer(target: self, action: #selector(touchEyeFunc))
        eyeImageView.isUserInteractionEnabled = true
        eyeImageView.addGestureRecognizer(touchEye)
    }

    @objc private func touchEyeFunc() {
        if passwordTextField.isSecureTextEntry == true {
            eyeImageView.image = UIImage(systemName: "eye.slash")
            passwordTextField.isSecureTextEntry = false
        } else {
            eyeImageView.image = UIImage(systemName: "eye")
            passwordTextField.isSecureTextEntry = true
        }
    }
}

