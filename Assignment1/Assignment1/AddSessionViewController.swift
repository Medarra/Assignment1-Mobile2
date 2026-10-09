//
//  AddSessionViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class AddSessionViewController: UIViewController {

    @IBOutlet var topicField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var membersField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Session"
    }
}
