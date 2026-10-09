//
//  AddSessionViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class AddSessionViewController: UIViewController {

    let topicField = UITextField()
    let timeField = UITextField()
    let membersField = UITextField()
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add Session"
        
        topicField.placeholder = "Topic"
        timeField.placeholder = "Time (e.g. 3 PM)"
        membersField.placeholder = "Members (comma seperated)"

        topicField.borderStyle = .roundedRect
        timeField.borderStyle = .roundedRect
        membersField.borderStyle = .roundedRect

        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact

        // Stack Layout
        let stack = UIStackView(arrangedSubViews: [topicField, timeField, membersField, datePicker])
        stack.axis = .vertical
        stack.spacing = 20
        stacl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])

        // Save Button:
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(saveSession)
        )
    }

    @objc func saveSession() {
        guard   let topic = topicField.text, !topic.isEmpty,
                let time = timeField.text, !time.isEmpty else {
                    let alert = UIAlertController(
                        title: "Missing Info",
                        message: "Please fill in topic and time.",
                        preferredStyle: .alert
                    )

                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    present(alert, animated: true)
                    return
                }

                let members = membersField.text?
                    .split(seperator: ",")
                    .map { $0.trimmingCharacters(in: .whitespaces) } ?? []

                let session = StudySession(
                    date: datePicker.date,
                    topic: topic,
                    time: time,
                    members: members
                )

                SessionStore.shared.addSession(session)

                navigationController?.popViewController(animated: true)
    }
}
