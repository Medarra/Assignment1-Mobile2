//
//  SessionDetailsViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionDetailsViewController: UIViewController {

    var sessionIndex: Int?
    @IBOutlet var tableView : UITableView!
    @IBOutlet var topicLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var memberLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Store received value from list view
        let index = sessionIndex
        // Check if received index is nil - if so return
        if index == nil {
            return
        }
        
        // Call SessionStore's session function at the received index
        let session = SessionStore.shared.session(at: index!)
        

 
        // Format date to put into string
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none

        let dateString = formatter.string(from: session.date)
        
        // Display session details
        topicLabel.text = session.topic
        timeLabel.text = session.time
        dateLabel.text = dateString
        memberLabel.text = session.members.joined(separator: ", ")
    }
}
