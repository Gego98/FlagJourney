//
//  ViewController.swift
//  FlagJourney
//
//  Created by Filip Gegovski on 21/04/2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var flagsManager = FlagsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let country = searchTextField.text {
            flagsManager.fetchFlags(countryName: country)
            
        }
        
        searchTextField.text = " "
    }
    
    func didUpdateFlags(flags: FlagsModel) {
        DispatchQueue.main.async {
            print(flags.countryName)
        }
    }
}

