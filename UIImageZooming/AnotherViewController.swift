//
//  anotherViewController.swift
//  UIImageZooming
//
//  Created by swstation on 7/31/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {
    

    @IBOutlet weak var myScrollView: UIScrollView!
    
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      for field in textFields {
            field.delegate = self
        }
        
    }
}
extension CharacterSet {
    static var checkPassword: CharacterSet {
        return CharacterSet(charactersIn: "-_.~")
            .union(.alphanumerics)
            .union(.decimalDigits)
            .union(.lowercaseLetters)
            .union(.uppercaseLetters)
    }
}

extension String {
    subscript(_ i: Int) -> Character {
        let index = self.index(startIndex, offsetBy: i)
        return self[index]
    }
    subscript(_ range: ClosedRange<Int>) -> String {
        let start = self.index(startIndex, offsetBy: range.lowerBound)
        let end = self.index(start, offsetBy: range.count-1)
        return String(self[start...end])
    }
}
extension AnotherViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let index = textFields.index(of: textField)!
        if index == textFields.count - 1 {
            let set = CharacterSet(charactersIn: textField.text!)
            
            if set.isDisjoint(with: CharacterSet.decimalDigits) {
                print("No decimals")
            } else {
                print("All good")
            }
            
//            if let t = set.intersection(CharacterSet.decimalDigits) as! CharacterSet {
//                print("UpperCase is normal!")}
//            if let _ = set.intersection(CharacterSet.uppercaseLetters) as! CharacterSet{
//               print("Decimal is normal!")           }
            
            
         } else {
           print("Nothing happent")
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let index = textFields.index(of: textField)!
        if index == textFields.count - 1 {
            let set = CharacterSet(charactersIn: string)
            if let indexRange = string.rangeOfCharacter(from:CharacterSet.checkPassword){
              
                    return true
                }
              
        }
            else {
                return false
            }
     return true
}
    
}

