//
//  ViewController.swift
//  SmallTalk
//
//  Created by Vibhu Appalaraju on 10/4/18.
//  Copyright © 2018 Vibhu Appalaraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func testButton(_ sender: Any) {
            performSegue(withIdentifier: "test", sender: nil)
    }
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attributedString = NSMutableAttributedString(string: "We do not post or share your information. By clicking yes, you're confirming you're 18+ and accepting our Terms and Conditions")
        attributedString.addAttribute(.link, value: "https://smalltalkproject.github.io/SmallTalk/", range: NSRange(location: 106, length: 20))
        //linkLabel.text  = attributedString
        textView.attributedText = attributedString
        textView.isEditable = false
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        UIApplication.shared.open(URL, options: [:])
        return false
        
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

