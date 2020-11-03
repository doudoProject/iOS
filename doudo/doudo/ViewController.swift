//
//  ViewController.swift
//  doudo
//
//  Created by 허예은 on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UITextField{
    func addLeftPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
