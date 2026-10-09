//
//  SessionListViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class SessionListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Session List"
        
        let button = UIButton(type: .system)
        button.setTitle("Open Session Details", for: .normal)
        button.addTarget(self, action: #selector(openDetails), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func openDetails() {
        navigationController?.pushViewController(SessionDetailsViewController(), animated: true)
    }
    
}
