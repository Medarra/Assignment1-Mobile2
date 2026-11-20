//
//  AddSessionViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class AddSessionViewController: UIViewController {
//Initialize all Fields for Manipulation
    @IBOutlet var topicField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var membersField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var topicLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var memberLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Set localized values for labels and placeholders
        title = NSLocalizedString("add_session", comment: "")
        
        topicLabel.text = NSLocalizedString("topic", comment: "")
        topicField.placeholder = NSLocalizedString("topic_example", comment: "")
        
        timeLabel.text = NSLocalizedString("time", comment: "")
        timeField.placeholder = NSLocalizedString("time_example", comment: "")
        
        memberLabel.text = NSLocalizedString("members", comment: "")
        membersField.placeholder = NSLocalizedString("members_example", comment: "")
        
        dateLabel.text = NSLocalizedString("study_group_date", comment: "")
        
        saveButton.setTitle((NSLocalizedString("save_session", comment: "")), for: .normal)
    }
    // Action on Click of saveButton
    @IBAction func saveSession(_ sender: Any) {
        // Check if fields are empty
        guard let topic = topicField.text, !topic.isEmpty,
              let time = timeField.text, !time.isEmpty else {
            
            // Error message if it isn't filled in
            let alert = UIAlertController(
                title: NSLocalizedString("missing_info", comment: ""),
                message: NSLocalizedString("fill_fields", comment: ""),
                preferredStyle: .alert
            )
            //alert.addAction(UIAlertAction(title:"OK", style: .default))
            alert.addAction(UIAlertAction(
                title: NSLocalizedString("ok", comment: "Alert confirmation button"),
                style: .default
            ))
            present(alert, animated: true)
            return
        }
        
        // Grab list of members added in field
        let members = membersField.text?
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) } ?? []
        
        let session = StudySession(date: datePicker.date, topic: topic, time: time, members: members)
        
        //Store data from session
        SessionStore.shared.addSession(session)
        
        navigationController?.popViewController(animated: true)
    }
    
    // Dismisses keyboard if clicked off of it.
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
}
