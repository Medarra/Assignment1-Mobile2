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
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var topicLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var memberLabel : UILabel!
    @IBOutlet var topicTitle : UILabel!
    @IBOutlet var timeTitle : UILabel!
    @IBOutlet var dateTitle : UILabel!
    @IBOutlet var memberTitle : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Store received value from list view
        let index = sessionIndex
        // Check if received index is nil - if so return
        if index == nil {
            return
        }
        
        detailsLabel.text = NSLocalizedString("study_sessions_details", comment: "")
        topicTitle.text = NSLocalizedString("study_topic", comment: "")
        timeTitle.text = NSLocalizedString("study_time", comment: "")
        dateTitle.text = NSLocalizedString("study_date", comment: "")
        memberTitle.text = NSLocalizedString("study_members", comment: "")
        
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
