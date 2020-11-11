//
//  UIPrimaryRoundButton.swift
//  doudo
//
//  Created by 허예은 on 2020/11/03.
//

import Foundation
import UIKit

class UIRoundPrimaryButton: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1)
        self.tintColor = UIColor.white
    }
}
