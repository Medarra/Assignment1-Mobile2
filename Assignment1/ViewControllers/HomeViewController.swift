//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var listButton : UIButton(type: .system)!
    @IBOutlet var addButton : UIButton(type: .system)!
    @IBOutlet var stack : UIStackView(arrangedSubviews: [listButton, addButton])!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
