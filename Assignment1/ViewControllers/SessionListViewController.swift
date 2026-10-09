//
//  SessionListViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sessions"

        //Set-up Table for Sessions Quick Look
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(tableView)
    }

    //Overriding so table updates when new session added.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    //Grabbing the Data

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionStore.shared.sessions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let session = SessionStore.shared.sessions[indexPath.row]

        cell.textLabel?.text = session.topic
        cell.detailTextLabel?.text = session.time

        return cell
    }
    
    //Navigating to the Session Details of a particular session.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = SessionDetailsViewController()
        detailsVC.sessionIndex = indexPath.row
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
