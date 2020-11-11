//
//  SignUpViewController.swift
//  doudo
//
//  Created by 허예은 on 2020/11/11.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordCheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboard()
    }
    
    func setKeyboard(){
        idTextField.addDoneButtonOnKeyboard()
        emailTextField.addDoneButtonOnKeyboard()
        nameTextField.addDoneButtonOnKeyboard()
        passwordTextField.addDoneButtonOnKeyboard()
        passwordCheckTextField.addDoneButtonOnKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_sender: Notification){
        self.view.frame.origin.y = -200
    }
    @objc func keyboardWillHide(_sender: Notification){
        self.view.frame.origin.y = 0
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
