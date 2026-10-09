//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        
        let listButton = UIButton(type: .system)
        listButton.setTitle("Session List", for: .normal)
        listButton.addTarget(self, action: #selector(openSessionList), for: .touchUpInside)
        
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add Session", for: .normal)
        addButton.addTarget(self, action: #selector(openAddSession), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [listButton, addButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func openSessionList() {
        navigationController?.pushViewController(SessionListViewController(), animated: true)
    }
    
    @objc func openAddSession() {
        navigationController?.pushViewController(AddSessionViewController(), animated: true)
    }
}
