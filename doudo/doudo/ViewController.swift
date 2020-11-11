//
//  ViewController.swift
//  doudo
//
//  Created by 허예은 on 2020/11/03.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboard();
    }
    
    func setKeyboard(){
        idTextField.delegate = self
        passwordTextField.delegate = self
        
        idTextField.addDoneButtonOnKeyboard()
        passwordTextField.addDoneButtonOnKeyboard()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_sender: Notification){
        self.view.frame.origin.y = -150
    }
    @objc func keyboardWillHide(_sender: Notification){
        self.view.frame.origin.y = 0
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        setLoading()
    }
    
    func setLoading(){
        let loading = NVActivityIndicatorView(frame: .zero, type: .ballBeat, color: UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1), padding: 0)
        
        loading.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(loading)

        NSLayoutConstraint.activate([
            loading.widthAnchor.constraint(equalToConstant: 60),
            loading.heightAnchor.constraint(equalToConstant: 60),
            loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        loading.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5){
            loading.stopAnimating()
            self.moveToMain()
        }
    }
    
    func moveToMain(){
        let vc = storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }

    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier:"SignUp") as! SignUpViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
