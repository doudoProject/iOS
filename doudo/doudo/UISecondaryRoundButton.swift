//
//  UISecondaryRoundButton.swift
//  doudo
//
//  Created by 허예은 on 2020/11/03.
//

import Foundation
import UIKit

class UIRoundSecondaryButton: UIButton{
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        self.tintColor = UIColor.white
    }
}
