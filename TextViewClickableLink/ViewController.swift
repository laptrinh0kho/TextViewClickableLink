//
//  ViewController.swift
//  TextViewClickableLink
//
//  Created by Kha on 5/23/20.
//  Copyright © 2020 Kha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegate cho textView
        textView.delegate = self
        
        //Set attributedText và link cho textView
        let mutableAttributedString = NSMutableAttributedString(
            string: "Bằng việc đăng ký, bạn đồng ý với Điều khoản sử dụng và Chính sách bảo mật của chúng tôi.")
        mutableAttributedString.setAsLink(textToFind: "Điều khoản sử dụng", linkName: "term")
        mutableAttributedString.setAsLink(textToFind: "Chính sách bảo mật của chúng tôi.",
                                          linkName: "policy")
        textView.attributedText = mutableAttributedString
    }
    
    //Hàm bắt sự kiện on tap trên Link của UITextViewDelegate
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if URL.absoluteString == "term" {
            //Action khi tap Điều khoản sử dụng
            print("On tap 'Điều khoản sử dụng'")
            return true
        } else if URL.absoluteString == "policy" {
            //Action khi tap Chính sách bảo mật của chúng tôi
            print("On tap 'Chính sách bảo mật của chúng tôi'")
            return true
        }
        return false
    }
}

//Set Link cho NSMutableAttributedString
extension NSMutableAttributedString {
    func setAsLink(textToFind:String, linkName:String) {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSAttributedString.Key.link, value: linkName, range: foundRange)
        }
    }
}
