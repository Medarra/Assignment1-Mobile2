//
//  SessionDetailsViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionDetailsViewController: UIViewController {

    var sessionIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // Get the session we want to display
        let session = SessionStore.shared.session(at: sessionIndex)

        // Title at top of navigation bar
        title = session.topic

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short

        // Create a label to show all details
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = """
        Date: \(formatter.string(from: session.date))
        Time: \(session.time)
        Members: \(session.members.joined(separator: ", "))
        """

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
}
