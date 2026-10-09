//
//  SessionListViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    //Overriding so table updates when new session added.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    //Grabbing the Datax

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return SessionStore.shared.sessions.count
        return SessionStore.shared.sessions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let session = SessionStore.shared.sessions[indexPath.row]

        cell.textLabel?.text = session.topic
        cell.detailTextLabel?.text = session.time

        return cell
    }
    
    //Navigating to the Session Details of a particular session.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedSession = SessionStore.shared.session(at: indexPath.row)
        
        
        let detailsVC = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! SessionDetailsViewController
        
        detailsVC.sessionIndex = indexPath.row
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
