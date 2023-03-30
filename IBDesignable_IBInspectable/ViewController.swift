//
//  ViewController.swift
//  IBDesignable_IBInspectable
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit

enum Operation {
    case Add
    case subtact
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var displayNum = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown // 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numValue = sender.titleLabel?.text else { return }
        if displayNum.isEmpty && numValue == "0" { return }
        if displayNum.count < 9 {
            displayNum += numValue
            resultLabel.text = displayNum
        }
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        displayNum = ""
        firstOperand = ""
        secondOperand = ""
        result = ""
        currentOperation = .unknown
        resultLabel.text = "0"
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if displayNum.count > 8 || displayNum.contains(".") { return }
        displayNum += displayNum.isEmpty ? "0." : "."
        resultLabel.text = displayNum
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        operation(op: .Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        operation(op: .Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        operation(op: .subtact)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        operation(op: .Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(op: currentOperation)
    }
    
    private func operation(op: Operation) {
        if currentOperation == .unknown {
            firstOperand = displayNum
            currentOperation = op
            displayNum = ""
        } else {
            if !displayNum.isEmpty {
                secondOperand = displayNum
                displayNum = ""
                guard let firstOperand = Double(firstOperand) else { return }
                guard let secondOperand = Double(secondOperand) else { return }
                switch currentOperation {
                case .Add:
                    result = "\(firstOperand + secondOperand)"
                    
                case .subtact:
                    result = "\(firstOperand - secondOperand)"
                    
                case .Multiply:
                    result = "\(firstOperand * secondOperand)"
                    
                case .Divide:
                    result = "\(firstOperand / secondOperand)"
                    
                default: break
                }
                if let result = Double(result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                self.firstOperand = result
                resultLabel.text = result
            }
            currentOperation = op
        }
    }
}

