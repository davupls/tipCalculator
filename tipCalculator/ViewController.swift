//
//  ViewController.swift
//  tipCalculator
//
//  Created by David Mclean on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var billAmount: UITextField!
	@IBOutlet weak var changePercentage: UISegmentedControl!
	
	@IBOutlet weak var totalPerPerson: UILabel!
	@IBOutlet weak var tipPerPerson: UILabel!
  
	@IBOutlet weak var numberOfPeople: UILabel!
	@IBOutlet weak var sliderValue: UISlider!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// MARK: Initialize Start Up Screen Data
		totalPerPerson.text = "$0"
		tipPerPerson.text = "0"
		
		billAmount.keyboardType = .numberPad
		sliderValue.value = 2
		
	}
		
		//MARK: Updates Screen Data when slider is moved
	@IBAction func changeSliderValue(_ sender: UISlider) {
		numberOfPeople.text = "Number of People: \(Int(sender.value.rounded()))"
	}
	
	
		//MARK: Do all calculations when user pushes button
	@IBAction func calculateButton(_ sender: UIButton) {
		let enteredAmount = Float(billAmount.text!)
		let segmentOptions = changePercentage.titleForSegment(at: changePercentage.selectedSegmentIndex)
		let tipPercent = Float(segmentOptions!.dropLast())
		let tipAmount = (((tipPercent! / 100) * enteredAmount!) * 1000).rounded() / 1000
		let slider = (sliderValue.value).rounded(.up)
		print(tipAmount)
		
		
		func makeShort(bill: Float) -> String {
			let value = ((bill / slider) + tipAmount)
			let shortenValueString = String(format: "%0.2f", value)
			
			return shortenValueString
		}
		
		
		totalPerPerson.text = "$\(String(describing: makeShort(bill: enteredAmount!)))"
		tipPerPerson.text = "$\(String(format: "%0.2f", tipAmount / slider))"
	 
	}
	
}

