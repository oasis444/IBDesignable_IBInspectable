//
//  RoundButton.swift
//  IBDesignable_IBInspectable
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
