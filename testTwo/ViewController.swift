//
//  ViewController.swift
//  testTwo
//
//  Created by Andrey Tolstov on 5/21/20.
//  Copyright © 2020 APNET HQ LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideSwitch: UISwitch!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        //Segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        mainLabel.text = String(slider.value)
        
        //Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
        
        //Switch
        hideSwitch.onTintColor = .red
    }

    @IBAction func chooseSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .blue
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
    
    @IBAction func doneButtonPressed() {
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(with: "The text field is empty", and: "Please enter your name")
            print("The text field is empty")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            print("Wrong format")
            return
        }
        
        mainLabel.text = inputText
        userNameTextField.text = ""
        
    }
    
    @IBAction func chooseDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func switchAction() {
        stackView.isHidden.toggle()
        
        switchLabel.text = hideSwitch.isOn ? "Show all elements" : "Hide all elements"
        
    }
    
}

//MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

