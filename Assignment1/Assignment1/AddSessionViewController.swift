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
    
    @IBAction func saveSession(_ sender: Any) {
        guard let topic = topicField.text, !topic.isEmpty,
              let time = timeField.text, !time.isEmpty else {
            
            let alert = UIAlertController(
                title: "Missing Info",
                message: "Please fill in topic and time",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let members = membersField.text?
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) } ?? []
        
        let session = StudySession(date: datePicker.date, topic: topic, time: time, members: members)
        
        SessionStore.shared.addSession(session)
        
        navigationController?.popViewController(animated: true)
    }
}
