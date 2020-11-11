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
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        comparePassword()
    }
    
    func comparePassword(){
        if(String(passwordTextField.text!) == String(passwordCheckTextField.text!)){
            // postSignIn()
        } else {
            alertPasswordNotCorrect()
        }
    }
//
//    func postSignIn(){
//        let parameters = ["userid": idTextField.text, "email": emailTextField.text, "password": passwordTextField.text, "name": nameTextField.text]
//        guard let url = URL(string:"https://doudo.run/goorm.io/v1/auth/signup") else { return }
//        var request = URLRequest(url:url)
//        request.httpMethod="POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//        request.httpBody = httpBody
//
//        let session = URLSession.shared
//        session.dataTask(with: request){
//            (data, response, error ) in
//            if let data = data {
//                do{
//                    let myResponse = response as! HTTPURLResponse
//                    print("status code \(myResponse.statusCode)")
//                    if myResponse.statusCode == 200{
//                        let log = try JSONDecoder().decode()
//                    }
//                }
//            }
//        }
//    }
    
    func alertPasswordNotCorrect(){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "경고", message: "비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
                                  
            alert.addAction(UIAlertAction(title: "확인", style: .default){
                (action) in
                self.passwordTextField.text = ""
                self.passwordCheckTextField.text = ""
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
