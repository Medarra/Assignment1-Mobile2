//
//  SessionDetailsViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionDetailsViewController: UIViewController {

    var sessionIndex: Int?

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
        
        // Display session details
        print(session.topic)
        print(session.time)
        print(session.date)
        print(session.members)
    }
}
