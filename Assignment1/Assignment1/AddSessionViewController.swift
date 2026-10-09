//
//  AddSessionViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class AddSessionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add Session"
        
        let label = UILabel()
        label.text = "Add Session Form Placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
