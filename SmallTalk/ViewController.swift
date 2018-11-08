//
//  ViewController.swift
//  SmallTalk
//
//  Created by Vibhu Appalaraju on 10/4/18.
//  Copyright © 2018 Vibhu Appalaraju. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBAction func testButton(_ sender: Any) {
            performSegue(withIdentifier: "test", sender: self)
    }
    
    
    @IBOutlet weak var textView: UITextView!
    
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributedString = NSMutableAttributedString(string: "We do not post or share your information. By clicking yes, you're confirming you're 18+ and accepting our Terms and Conditions")
        attributedString.addAttribute(.link, value: "https://smalltalkproject.github.io/SmallTalk/", range: NSRange(location: 106, length: 20))
        //linkLabel.text  = attributedString
        textView.attributedText = attributedString
        textView.isEditable = false
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation() //only gets location once pt 1
            
        }
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        UIApplication.shared.open(URL, options: [:])
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //only gets location once pt 2
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
        }
    }
    
    //only gets location once pt 3
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

}

