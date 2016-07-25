//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        fruitPicker.delegate = self
        fruitPicker.dataSource = self
        
        
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        
        self.resultLabel.hidden = true
        
        let randomNumber0 = arc4random_uniform(UInt32(fruitsArray.count))
        
        self.fruitPicker.selectRow(Int(randomNumber0), inComponent: 0, animated: true)
        
        let resultingFruit0 = fruitsArray[self.fruitPicker.selectedRowInComponent(0)]
        
        
        let randomNumber1 = arc4random_uniform(UInt32(fruitsArray.count))
        
        self.fruitPicker.selectRow(Int(randomNumber1), inComponent: 1, animated: true)
        
        let resultingFruit1 = fruitsArray[self.fruitPicker.selectedRowInComponent(1)]
        
        
        let randomNumber2 = arc4random_uniform(UInt32(fruitsArray.count))
        
        self.fruitPicker.selectRow(Int(randomNumber2), inComponent: 2, animated: true)
        
        let resultingFruit2 = fruitsArray[self.fruitPicker.selectedRowInComponent(2)]
        
        checkForWin(resultingFruit0, result2: resultingFruit1, result3: resultingFruit2)
        
        
        self.resultLabel.hidden = false
        
    }
    
    func checkForWin(result: String, result2: String, result3: String) {
        
        if result == result2 && result2 == result3 {
            
            self.resultLabel.text = "WINNER!"
            
        } else {
            
            self.resultLabel.text = "TRY AGAIN"
        }
        
        
        
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return fruitsArray[row]
    }
    
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



